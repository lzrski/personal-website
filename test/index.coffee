{expect} = require 'chai'
Firebase = require 'firebase'
config   = require 'config-object'
config.load '../config.cson', required: yes

describe 'Firebase security rules', () ->
  @timeout 5000
  {
    secret
    url
  } = config.firebase

  after () ->
    db = new Firebase url
    remove = (id) ->
      new Promise (resolve, reject) ->
        (db.child id).remove (error) ->
          if error then reject error
          else do resolve

    new Promise (resolve, reject) ->
      callback = (snapshot) ->
        promises = []
        for id, message of snapshot.val()
          if message.email is 'test@test.com'
            promises.push remove id
        (Promise.all promises).then resolve

      db.once 'value', callback


  it "doesn't allow unauthorised client to receive data", () ->
    # I expect not to receive data because of Firebase security rules
    new Promise (resolve, reject) ->
      db = new Firebase url
      callback = (snapshot) ->
        reject Error 'Data received. Unauthorised user should not have access to database.'
      cancelCallback = (error) ->
        expect error
          .to.have.property 'code'
          .equal 'PERMISSION_DENIED'
        do resolve

      db.once 'value', callback, cancelCallback

  it "doesn't allow unauthorised client to change existing data", () ->
    new Promise (resolve, reject) ->
      db = new Firebase url
      message =
        company     : "Best dogs"
        email       : "test@test.com"
        description : "Hau"
      child = db.push message, (error) ->
        if error then return reject error
        child.update company: "Best horses", (error) ->
          if error
            expect error
              .to.have.property 'code'
              .equal 'PERMISSION_DENIED'
            do resolve
          else reject Error "Unauthorised client can change existing data"


  it "doesn't allow unauthorised client to delete existing data", () ->
    new Promise (resolve, reject) ->
      db = new Firebase url
      message =
        company     : "Best ducks"
        email       : "test@test.com"
        description : "Kwa"
      child = db.push message, (error) ->
        if error then return reject error
        child.remove (error) ->
          if error
            expect error
              .to.have.property 'code'
              .equal 'PERMISSION_DENIED'
            do resolve
          else reject Error "Unauthorised client can delete existing data"


  it 'allows all users to write new data', () ->
    # Expect to add data to Firebase by any user
    new Promise (resolve, reject) ->
      db = new Firebase url
      message =
        company     : "Best cats"
        email       : "test@test.com"
        description : "Miau"

      child = db.push message, (error) ->
        if error then return reject error

        do resolve

      # TODO: Validate that the data was saved correctly
      # FIXME: Callback to on value is called synchronously before error can be handled.
      # child.once 'value', (snapshot) ->
      #   console.log 'snapshot'
      #   expect snapshot.val()
      #     .to.eql message

  it "allows authorised client to receive data", () ->
    new Promise (resolve, reject) ->
      db = new Firebase url
      db.authWithCustomToken secret, (error) ->
        if error then return reject error

        message =
          company     : "Best bears"
          email       : "test@test.com"
          description : "Grrrru"

        child = db.push message, (error) ->
          if error then return reject error

        callback = (snapshot) ->
          do resolve
        cancelCallback = (error) ->
          reject error

        db.once 'value', callback, cancelCallback


  it 'allows authorised client to change existing data', () ->
    new Promise (resolve, reject) ->
      db = new Firebase url
      db.authWithCustomToken secret, (error) ->
        if error then return reject error

        message =
          company     : "Best pumas"
          email       : "test@test.com"
          description : "Rroarr"

        child = db.push message, (error) ->
          if error then return reject error

        child.update company: "Best penguins", (error) ->
          if error then return reject error
          do resolve
