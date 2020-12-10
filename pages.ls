require! {
    \./pages/wallets.ls
    \./pages/reviewwords.ls
    \./pages/restorewords.ls
    \./pages/history.ls
    \./pages/send.ls
    \./pages/receive.ls
    \./pages/locked.ls
    \./pages/sent.ls
    \./pages/loading.ls
    \./pages/loading2.ls
    \./pages/invoice.ls
    \./pages/terms.ls
    \./pages/terms2.ls
    \./pages/privacy.ls
    \./pages/filestorage.ls
    \./pages/settings.ls
    \./pages/chooseinit.ls
    \./pages/newseedrestore.ls
    \./pages/verifyseed.ls
    \./pages/staking.ls
    \./pages/resources.ls
    \./pages/search.ls
    \./pages/resources2.ls
    \./pages/choosestaker.ls
    \./pages/videostorage.ls
    \./pages/videostoragedetails.ls
    \./pages/info.ls
    \./pages/faq.ls
    \./pages/claim.ls
    \./pages/soundstorage.ls
    \./pages/monitor.ls
    \./pages/notification.ls
    \./pages/offlinewallets.ls
    \./pages/downloadwallet.ls
    \./pages/vote.ls
    \./pages/util.ls
}
is-in-iframe = window != window.parent
if is-in-iframe
    export verifyseed
    export loading
    export loading2
    export wallets
    export history
    export send
    export locked
    export sent
    export terms
    export terms2
    export privacy
    export chooseinit
    export newseedrestore
    export restorewords
    export reviewwords
else
    export offlinewallets
    export downloadwallet
    export monitor
    export resources
    export staking
    export verifyseed
    export loading
    export loading2
    export wallets
    export history
    export send
    export receive
    export locked
    export sent
    export invoice
    export terms
    export terms2
    export privacy
    export filestorage
    export settings
    export chooseinit
    export newseedrestore
    export search
    export resources2
    export choosestaker
    export videostorage
    export videostoragedetails
    export info
    export faq
    export claim
    export soundstorage
    export notification
    export restorewords
    export reviewwords
    export vote
    export util