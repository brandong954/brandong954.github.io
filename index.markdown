---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
---
<body>
  <h1>This Past Week</h1>
  <ul>
    {% assign today = site.time | date: "%Y-%m-%d" %}
    {% assign six_days_ago = today | date: "%s" | minus: 518400 | date: "%Y-%m-%d" %}
    {% for post in site.posts %}
      {% assign post_date = post.date | date: "%Y-%m-%d" %}
      {% if post_date >= six_days_ago %}
        <li>
          <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
          <p>{{ post.excerpt }}</p>
          <p>Genres: 
            {% for genre in post.genres %}
              <a href="/genre/{{ genre }}">{{ genre }}</a>{% unless forloop.last %}, {% endunless %}
            {% endfor %}
          </p>
        </li>
      {% endif %}
    {% endfor %}
  </ul>
  <h1>All Past Posts</h1>
</body>

