---
layout: default
description: "A blog about web development, design, startup culture and the lives of three starting entrepreneurs. This is the hangout place of the people at PieSync."
---
{% include JB/setup %}


<div id="beta-panel">
  <h2 class="no-padmar title" style="margin-top: 5px">Subscribe for Private PieSync Beta</h2>
  <h4 class="no-padmar title" style="margin-top: 5px">Finally have the power of Highrise in your Gmail</h4>
  <div style="height: 135px; margin-top: 5px">
    <ul class="no-padmar">
      <li>Up to date information</li>
      <li>Facilitate interaction</li>
      <li>Full mobile access</li>
      <li>No installations</li>
    </ul>
    <div class="form" id="beta-cta">
      <p class="no-padmar" style="font-size: 14px; margin-bottom: 5px">
        Fill in your email and be one of the first to try it out:
      </p>
      <form class="beta">
        <input type="text" placeholder="email" name="email" id="beta-email" />
        <input type="submit" name="submit" id="submit" value="Get me on the list" />
      </form>
    </div>
    <div id="feedback" style="display: none; width: 225px;">
      <p class="no-padmar" style="font-weight:bold;">Thank you for your interest.</p>
      <p class="no-padmar">You will receive a mail shortly as confirmation, make sure to also check your spam folder.</p>
      <p class="no-padmar">
        <a onclick="_gaq.push(['_trackEvent', 'beta', 'social', 'twitter', document.getElementById('email').value])" href="https://twitter.com/share?text=I+just+signed+up+to+get+integration+of+Highrise+in+my+Gmail.+Check+out&amp;url=http://piesync.com&amp;via=piesync" style="color:#B5E6CA">Tweet this</a>
         or 
        <a onclick="_gaq.push(['_trackEvent', 'beta', 'social', 'twitter', document.getElementById('email').value])" href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fwww.piesync.com" style="color:#B5E6CA">facebook it</a>
      </p>
    </div>
  </div>
</div>

{% for post in site.posts offset:0 limit:10 %}
<section class="post">
  <h1><a href="{{post.id}}" title="{{ post.title | strip_html | truncatewords: 6}}">{{ post.title }}</a></h1>
  <div class="sub">
    {% if post.author %}
    <span class="author">{{ post.author }}</span>
    {% endif %}
    <span class="date">{{ post.date | date_to_string_short }}</span>
    <span class="comments">
      <a href="{{post.id}}#disqus_thread">Comments</a>
    </span>
  </div>
  {{ post.content | short_post_content }}
  <p class="more">
    <a href="{{post.id}}">
      Read more
    </a>
  </p>
</section>
{% endfor %}

<a style="font-size: 18px" href="archive.html" title="Older posts">Older Posts</a>