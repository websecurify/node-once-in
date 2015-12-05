module.exports = (func, seconds=0, minutes=0, hours=0) ->
    interval = (seconds) + (minutes * 60) + (hours * 60 * 60)
    last = undefined

    ->
        unless last?
            last = Date.now()

            return func.apply(func, arguments)

        now = Date.now()
        delta = now - last
        last = now

        return if delta < interval
        return func.apply(func, arguments)
