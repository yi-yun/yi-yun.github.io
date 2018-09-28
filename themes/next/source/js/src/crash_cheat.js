
 var OriginTitle = document.title;
 var titleTime;
 document.addEventListener('visibilitychange', function () {
     if (document.hidden) {
         $('[rel="icon"]').attr('href', "/images/TEP.png");
         document.title = '╭(°A°`)╮ 提需求的来了 ~';
         clearTimeout(titleTime);
     }
     else {
         $('[rel="icon"]').attr('href', "/images/favicon-16x16-next.png");
         document.title = '(ฅ>ω<*ฅ) 噫又跑了~' + OriginTitle;
         titleTime = setTimeout(function () {
             document.title = OriginTitle;
         }, 2000);
     }
 });