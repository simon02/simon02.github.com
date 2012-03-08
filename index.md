---
layout: default
description: "A blog about web development, design, startup culture and the lives of three starting entrepreneurs. This is the hangout place of the people at PieSync."
---
{% include JB/setup %}

{% for post in site.posts offset:0 limit:15 %}
<section class="post">
  <h1>{{ post.title }}</h1>
  <div class="sub">
    {% if post.author %}
    <span class="author">{{ post.author }}</span>
    {% endif %}
    <span class="date">{{ post.date | date_to_string_short }}</span>
    <span class="comments">
      <a href="#">0 comments</a>
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