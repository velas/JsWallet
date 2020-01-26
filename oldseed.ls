require! {
    \localStorage
}
module.exports = ->
    val = local-storage.get-item(\seed) ? ""
    local-storage.set-item(\seed, "")
    val