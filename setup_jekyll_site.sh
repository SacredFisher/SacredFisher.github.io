#!/bin/bash

# Setup script for SacredFisher.github.io Jekyll site
# This script creates the directory structure and files for a Jekyll-based GitHub Pages site

# Exit if any command fails
set -e

# Create directories
echo "Creating Jekyll directory structure..."
mkdir -p _data _includes _layouts _posts assets/css assets/images assets/js pages
mkdir -p _posts/ai-ml _posts/sci _posts/linalg _posts/graphs _posts/math _posts/mov _posts/musiq _posts/meditation _posts/myths _posts/misc

# Create _config.yml
echo "Creating _config.yml..."
cat > _config.yml << 'EOF'
# Site settings
title: SacredFisher's Blog
email: your-email@example.com
description: >- 
  A multi-topic blog covering AI/ML, Science, Linear Algebra, Graph Theory, 
  Math, Movies, Music, Meditation, Myths, and other topics.
baseurl: "" # the subpath of your site, e.g. /blog
url: "https://sacredfisher.github.io" # the base hostname & protocol
github_username: SacredFisher

# Build settings
markdown: kramdown
theme: minima
plugins:
  - jekyll-feed
  - jekyll-seo-tag

# Collections for organizing content
collections:
  ai-ml:
    output: true
    permalink: /ai-ml/:name
  sci:
    output: true
    permalink: /sci/:name
  linalg:
    output: true
    permalink: /linalg/:name
  graphs:
    output: true
    permalink: /graphs/:name
  math:
    output: true
    permalink: /math/:name
  mov:
    output: true
    permalink: /mov/:name
  musiq:
    output: true
    permalink: /musiq/:name
  meditation:
    output: true
    permalink: /meditation/:name
  myths:
    output: true
    permalink: /myths/:name
  misc:
    output: true
    permalink: /misc/:name

# Default front matter settings
defaults:
  - scope:
      path: ""
    values:
      layout: "default"
  - scope:
      path: ""
      type: "posts"
    values:
      layout: "post"
  - scope:
      path: ""
      type: "pages"
    values:
      layout: "page"
EOF

# Create navigation.yml
echo "Creating navigation.yml..."
mkdir -p _data
cat > _data/navigation.yml << 'EOF'
- name: Home
  link: /
- name: AI/ML
  link: /pages/ai-ml.html
- name: Sci
  link: /pages/sci.html
- name: LinAlg
  link: /pages/linalg.html
- name: Graphs
  link: /pages/graphs.html
- name: Math
  link: /pages/math.html
- name: .Mov
  link: /pages/mov.html
- name: μsiq
  link: /pages/musiq.html
- name: Meditation
  link: /pages/meditation.html
- name: Myths
  link: /pages/myths.html
- name: Misc
  link: /pages/misc.html
EOF

# Create _includes files
echo "Creating _includes files..."
cat > _includes/head.html << 'EOF'
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>{% if page.title %}{{ page.title | escape }}{% else %}{{ site.title | escape }}{% endif %}</title>
<meta name="description" content="{{ page.excerpt | default: site.description | strip_html | normalize_whitespace | truncate: 160 | escape }}">
<link rel="stylesheet" href="{{ "/assets/css/main.css" | relative_url }}">
<link rel="canonical" href="{{ page.url | replace:'index.html','' | absolute_url }}">
{% feed_meta %}
{% seo %}
EOF

cat > _includes/header.html << 'EOF'
<header class="site-header">
  <div class="wrapper">
    <a class="site-title" href="{{ "/" | relative_url }}">{{ site.title | escape }}</a>
    {% include navigation.html %}
  </div>
</header>
EOF

cat > _includes/footer.html << 'EOF'
<footer class="site-footer">
  <div class="wrapper">
    <h2 class="footer-heading">{{ site.title | escape }}</h2>
    <div class="footer-col-wrapper">
      <div class="footer-col">
        <p>{{ site.description | escape }}</p>
      </div>
      <div class="footer-col">
        <ul class="social-media-list">
          {% if site.github_username %}
          <li>
            <a href="https://github.com/{{ site.github_username }}">
              <span>GitHub: {{ site.github_username }}</span>
            </a>
          </li>
          {% endif %}
        </ul>
      </div>
    </div>
  </div>
</footer>
EOF

cat > _includes/navigation.html << 'EOF'
<nav class="site-nav">
  <ul>
    {% for item in site.data.navigation %}
      <li>
        <a href="{{ item.link }}" {% if page.url == item.link %}class="active"{% endif %}>
          {{ item.name }}
        </a>
      </li>
    {% endfor %}
  </ul>
</nav>
EOF

# Create layouts
echo "Creating layout files..."
cat > _layouts/default.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
  {% include head.html %}
</head>
<body>
  <div class="wrapper">
    {% include header.html %}
    <main class="page-content">
      {{ content }}
    </main>
    {% include footer.html %}
  </div>
</body>
</html>
EOF

cat > _layouts/page.html << 'EOF'
---
layout: default
---
<article class="post">
  <header class="post-header">
    <h1 class="post-title">{{ page.title | escape }}</h1>
  </header>
  <div class="post-content">
    {{ content }}
  </div>
</article>
EOF

cat > _layouts/post.html << 'EOF'
---
layout: default
---
<article class="post">
  <header class="post-header">
    <h1 class="post-title">{{ page.title | escape }}</h1>
    <p class="post-meta">
      <time datetime="{{ page.date | date_to_xmlschema }}">
        {{ page.date | date: "%B %-d, %Y" }}
      </time>
      {% if page.categories %}
      • 
      <span class="post-categories">
        {% for category in page.categories %}
        <a href="/pages/{{ category }}.html">{{ category }}</a>
        {% endfor %}
      </span>
      {% endif %}
    </p>
  </header>
  <div class="post-content">
    {{ content }}
  </div>
</article>
EOF

# Create index.md
echo "Creating index.md..."
cat > index.md << 'EOF'
---
layout: default
title: Home
---

# Welcome to My Multi-Topic Blog

Exploring ideas across multiple disciplines.

## Recent Posts

<div class="posts-grid">
  {% for post in site.posts limit:6 %}
    <div class="post-preview">
      <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
      <p class="post-meta">{{ post.date | date: "%B %d, %Y" }} • 
      {% for category in post.categories %}
        <a href="/pages/{{ category }}.html">{{ category }}</a>{% unless forloop.last %}, {% endunless %}
      {% endfor %}
      </p>
      <p>{{ post.excerpt }}</p>
    </div>
  {% endfor %}
</div>
EOF

# Create 404.html
echo "Creating 404.html..."
cat > 404.html << 'EOF'
---
layout: default
---

<style type="text/css" media="screen">
  .container {
    margin: 10px auto;
    max-width: 600px;
    text-align: center;
  }
  h1 {
    margin: 30px 0;
    font-size: 4em;
    line-height: 1;
    letter-spacing: -1px;
  }
</style>

<div class="container">
  <h1>404</h1>
  <p><strong>Page not found :(</strong></p>
  <p>The requested page could not be found.</p>
</div>
EOF

# Create main.scss
echo "Creating main.scss..."
mkdir -p assets/css
cat > assets/css/main.scss << 'EOF'
---
---

@import "minima";

// Your custom styles below
.site-nav {
  ul {
    display: flex;
    flex-wrap: wrap;
    list-style: none;
    padding: 0;
    margin: 0;
    
    li {
      margin-right: 1rem;
      
      a {
        display: block;
        padding: 0.5rem;
        text-decoration: none;
        
        &.active {
          font-weight: bold;
          text-decoration: underline;
        }
        
        &:hover {
          text-decoration: underline;
        }
      }
    }
  }
}

.posts-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 2rem;
  
  .post-preview {
    border: 1px solid #ddd;
    padding: 1rem;
    border-radius: 5px;
  }
}
EOF

# Create category pages
echo "Creating category pages..."
for category in ai-ml sci linalg graphs math mov musiq meditation myths misc; do
  title=$(echo "$category" | sed 's/ai-ml/AI\/ML/' | sed 's/linalg/Linear Algebra/' | sed 's/mov/.Mov/' | sed 's/musiq/μsiq/' | sed 's/sci/Science/' | sed 's/misc/Miscellaneous/' | sed 's/^./\u&/')
  
  cat > "pages/${category}.md" << EOF
---
layout: page
title: ${title}
permalink: /pages/${category}.html
---

# ${title}

This is where I share thoughts, projects, and insights about ${title}.

## All ${title} Posts

<ul class="post-list">
  {% for post in site.posts %}
    {% if post.categories contains "${category}" %}
      <li>
        <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
        <p class="post-meta">{{ post.date | date: "%B %d, %Y" }}</p>
        <p>{{ post.excerpt }}</p>
      </li>
    {% endif %}
  {% endfor %}
</ul>
EOF
done

# Create sample post
echo "Creating sample post..."
cat > _posts/ai-ml/$(date +%Y-%m-%d)-welcome.md << 'EOF'
---
layout: post
title: "Welcome to My AI/ML Blog"
categories: ai-ml
excerpt: "This is a sample post in the AI/ML category."
---

# Welcome to My AI/ML Blog

This is a sample post that demonstrates how to create content in Jekyll.

## What to Expect

In this category, I'll be sharing my thoughts, research, and projects related to Artificial Intelligence and Machine Learning.

Stay tuned for more content!
EOF

# Create .gitignore
echo "Creating .gitignore..."
cat > .gitignore << 'EOF'
_site
.sass-cache
.jekyll-cache
.jekyll-metadata
vendor
.bundle
EOF

# Create Gemfile
echo "Creating Gemfile..."
cat > Gemfile << 'EOF'
source "https://rubygems.org"

#gem "jekyll", "~> 4.3.2"
# This is the default theme for new Jekyll sites
gem "minima", "~> 2.5"
# If you want to use GitHub Pages, remove the "gem "jekyll"" above and
# uncomment the line below. To upgrade, run `bundle update github-pages`.
 gem "github-pages", group: :jekyll_plugins
group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.12"
  gem "jekyll-seo-tag", "~> 2.8"
end

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", "~> 1.2"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.1", :platforms => [:mingw, :x64_mingw, :mswin]
# Lock `http_parser.rb` gem to `v0.6.x` on JRuby builds since newer versions of the gem
# do not have a Java counterpart.
gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]
EOF

# Create README.md
echo "Creating README.md..."
cat > README.md << 'EOF'
# SacredFisher.github.io

My personal blog covering various topics:
- AI/ML
- Science
- Linear Algebra
- Graphs
- Math
- Movies
- μsiq
- Meditation
- Myths
- Miscellaneous

## Development

This site is built with Jekyll. To run locally:

1. Clone this repository
2. Install dependencies: `bundle install`
3. Run the local server: `bundle exec jekyll serve`
4. Visit `http://localhost:4000` in your browser

## License

All content is copyright © $(date +%Y) SacredFisher.
EOF

# Initial commit
echo "Creating initial git commit..."
git add .
git commit -m "Initial Jekyll site setup"

echo ""
echo "================================================================"
echo "Jekyll site setup complete!"
echo "================================================================"
echo ""
echo "Your Jekyll site structure has been created in the 'SacredFisher.github.io' directory."
echo ""
echo "Next steps:"
echo "1. Make sure Ruby and Jekyll are installed on your system"
echo "2. cd SacredFisher.github.io"
echo "3. Run 'bundle install' to install dependencies"
echo "4. Run 'bundle exec jekyll serve' to test the site locally"
echo "5. Create a repository on GitHub named 'SacredFisher.github.io'"
echo "6. Follow GitHub's instructions to push your local repository"
echo ""
echo "Your site will be available at https://SacredFisher.github.io once published."
echo "================================================================"