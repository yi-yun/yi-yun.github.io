<div class="copyright">{#
#}{% set current = date(Date.now(), "YYYY") %}{#
#}&copy; {% if theme.footer.since and theme.footer.since != current %}{{ theme.footer.since }} &mdash; {% endif %}{#
#}<span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love" id="animate">
    <i class="fa fa-{{ theme.footer.icon.name }}"></i>
  </span>
  <span class="author" itemprop="copyrightHolder">{{ theme.footer.copyright | default(author) }}</span>

  {% if config.symbols_count_time.total_symbols %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-area-chart"></i>
    </span>
    {% if theme.symbols_count_time.item_text_total %}
      <span class="post-meta-item-text">{{ __('symbols_count_time.count_total') + __('symbol.colon') }}</span>
    {% endif %}
    <span title="{{ __('symbols_count_time.count_total') }}">{#
    #}{{ symbolsCountTotal(site) }}{#
  #}</span>
  {% endif %}

  {% if config.symbols_count_time.total_time %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-coffee"></i>
    </span>
    {% if theme.symbols_count_time.item_text_total %}
      <span class="post-meta-item-text">{{ __('symbols_count_time.time_total')}} &asymp;</span>
    {% endif %}
    <span title="{{ __('symbols_count_time.time_total') }}">{#
    #}{{ symbolsTimeTotal(site, theme.symbols_count_time.awl, theme.symbols_count_time.wpm, __('symbols_count_time.time_minutes')) }}{#
  #}</span>
  {% endif %}
</div>

{% if theme.seo %}
  {% set nofollow = ' rel="external nofollow"' %}
{% endif %}


{% if theme.footer.powered.enable %}
  <div class="powered-by">{#
  #}{{ __('footer.powered', '<a class="theme-link" target="_blank"' + nofollow + ' href="https://hexo.io">Hexo</a>') }}{% if theme.footer.powered.version %} v{{ hexo_env('version') }}{% endif %}{#
#}</div>
{% endif %}

{% if theme.footer.powered.enable and theme.footer.theme.enable %}
  <span class="post-meta-divider">|</span>
{% endif %}

{% if theme.footer.theme.enable %}
  <div class="theme-info">{#
  #}{{ __('footer.theme') }} &mdash; {#
  #}<a class="theme-link" target="_blank"{{ nofollow }} href="https://theme-next.org">{#
    #}NexT.{{ theme.scheme }}{#
  #}</a>{% if theme.footer.theme.version %} v{{ version }}{% endif %}{#
#}</div>
{% endif %}

{% if theme.footer.custom_text %}
  <div class="footer-custom">{#
  #}{{ theme.footer.custom_text }}{#
#}</div>
{% endif %}

<!--<div class="acris-blog-footer">
  <span>
    Powered by
    <a href="https://console.upyun.com/register/?invite=HyBuD3DXM" title="又拍云" target="_blank">
      <img src="//cdn.reorz.com/images/2017/02/upyun_logo.png" alt="UPYUN">
    </a>
    and
    <a href="https://www.vultr.com/?ref=6821762" title="Vultr" target="_blank">
      <img src="//cdn.reorz.com/images/2017/02/vultr_logo.png" alt="Vultr">
    </a>
  </span>
</div>-->
<!--<div class="friend-links">
  <span>
    <i class="fa  fa-fw fa-link"></i>友链：
    <a href="https://www.teaper.cn"  target="_blank">
      Teaper
    </a>
    &nbsp;
    <a href="https://www.cnblogs.com/kjsd/"  target="_blank">
      如是艰难繁琐
    </a>
  </span>
</div>-->

<span id="timeDate">载入天数...</span>
<span id="times">载入时分秒...</span> 
<script> 
var now = new Date(); 
function createtime() {
   var grt= new Date("07/30/2018 15:41:34");//2018-07-30 15:41:34
   //此处修改你的建站时间或者网站上线时间 
   now.setTime(now.getTime()+250); 
   days = (now - grt ) / 1000 / 60 / 60 / 24; 
   dnum = Math.floor(days); hours = (now - grt ) / 1000 / 60 / 60 - (24 * dnum); 
   hnum = Math.floor(hours); 
   if(String(hnum).length ==1 ){
     hnum = "0" + hnum;
     } 
     minutes = (now - grt ) / 1000 /60 - (24 * 60 * dnum) - (60 * hnum);
      mnum = Math.floor(minutes); if(String(mnum).length ==1 )
      {
        mnum = "0" + mnum;
      } 
      seconds = (now - grt ) / 1000 - (24 * 60 * 60 * dnum) - (60 * 60 * hnum) - (60 * mnum);
       snum = Math.round(seconds);
        if(String(snum).length ==1 ){snum = "0" + snum;} 
        document.getElementById("timeDate").innerHTML = "已运行 "+dnum+" 天 ";
         document.getElementById("times").innerHTML = hnum + " 小时 " + mnum + " 分 " + snum + " 秒"; 
         } setInterval("createtime()",250); 
</script>

