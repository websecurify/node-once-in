once_in = require '../src/'

@t1 = (test) ->
    f = -> return 'abc'

    test.ok f() is 'abc'

    f = once_in f

    test.ok f() is 'abc'
    test.ok f() is 'abc'
    test.ok f() is 'abc'

    test.done()

@t2 = (test) ->
    f = -> return '123'

    test.ok f() is '123'

    f = once_in f, 1 # once every second

    test.ok f() is '123'
    test.ok not f()

    setTimeout ->
        test.ok f() is '123'
        test.ok not f()
        test.ok not f()
        test.ok not f()

        test.done()

    , 1000

@t3 = (test) ->
    f = -> return 'xyz'

    test.ok f() is 'xyz'

    f = once_in f, 1 # once every second

    test.ok f() is 'xyz'
    test.ok not f()

    setTimeout ->
        test.ok f() is 'xyz'
        test.ok not f()
        test.ok not f()
        test.ok not f()

        setTimeout ->
            test.ok f() is 'xyz'
            test.ok not f()
            test.ok not f()
            test.ok not f()

            setTimeout ->
                test.ok f() is 'xyz'
                test.ok not f()
                test.ok not f()
                test.ok not f()

                test.done()

            , 1000

        , 1000

    , 1000
