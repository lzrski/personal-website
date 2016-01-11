nodemailer = require 'nodemailer'
Firebase   = require 'firebase'
config     = require 'config-object'

config.load '../config.cson', required: yes
database   = new Firebase config.firebase.url

database.authWithCustomToken config.firebase.secret, (error) ->
  if error then throw error

  transporter = nodemailer.createTransport config.nodemailer

  callback = (dataSnapshot) =>
    {
      company,
      email,
      description,
      processed
    } = dataSnapshot.val()
    return console.log {processed} if processed

    transporter.sendMail
      to: config.recipients
      subject: "New contact from #{company} (#{email})"
      replyTo: email
      text: description
      (error, info) =>
        if error then return console.error error
        Object.assign info, date: Date.now()
        console.log info
        dataSnapshot
          .ref()
          .child 'processed'
          .set info

  cancelCallback = (error) =>
    throw error

  database.on "child_added", callback, cancelCallback
