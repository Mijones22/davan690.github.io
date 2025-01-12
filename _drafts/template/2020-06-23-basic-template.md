---
title: "Jekyll structure rules"
subtitle: "The simple rules of Jekyll"
layout: post
tags: ["gl", "overview", "website", "research", "tools"]
image: /img/center-logo-white.png
bigimg: /img/
permlink: jekyll-rules.html
---

<h2>Initial Setup</h2>
<p>After <a href="/index.html#start-now">installing jekyll</a> you&#8217;ll need to format your website directory in a way jekyll expects.
Jekyll-bootstrap conveniently provides the base directory format.</p>

<h3>The Jekyll Application Base Format</h3>
<p>Jekyll expects your website directory to be laid out like so:</p>
<pre><code>.
|-- _config.yml
|-- _includes
|-- _layouts
|   |-- default.html
|   |-- post.html
|-- _posts
|   |-- 20011-10-25-open-source-is-good.markdown
|   |-- 20011-04-26-hello-world.markdown
|-- _site
|-- index.html
|-- assets
    |-- css
        |-- style.css
    |-- javascriptsc
</code></pre>

<ul>
<li><p><strong>_config.yml</strong><br/>
  Stores configuration data.</p></li>
<li><p><strong>_includes</strong><br/>
  This folder is for partial views.</p></li>
<li><p><strong>_layouts</strong> <br/>
  This folder is for the main templates your content will be inserted into.
  You can have different layouts for different pages or page sections.</p></li>
<li><p><strong>_posts</strong><br/>
  This folder contains your dynamic content/posts.
  the naming format is required to be <code>@YEAR-MONTH-DATE-title.MARKUP@</code>.</p></li>
<li><p><strong>_site</strong><br/>
  This is where the generated site will be placed once Jekyll is done transforming it.</p></li>
<li><p><strong>assets</strong><br/>
  This folder is not part of the standard jekyll structure.
  The assets folder represents <em>any generic</em> folder you happen to create in your root directory.
  Directories and files not properly formatted for jekyll will be left untouched for you to serve normally.</p></li>
</ul>


<p>(read more: <a href="https://github.com/mojombo/jekyll/wiki/Usage">https://github.com/mojombo/jekyll/wiki/Usage</a>)</p>
<h3>Jekyll Configuration</h3>
<p>Jekyll supports various configuration options that are fully outlined here:
<a href="https://github.com/mojombo/jekyll/wiki/Configuration">https://github.com/mojombo/jekyll/wiki/Configuration</a></p>

<h2>Content in Jekyll</h2>
<p>Content in Jekyll is either a post or a page.
These content &#8220;objects&#8221; get inserted into one or more templates to build the final output for its respective static-page.</p>

<h3>Posts and Pages</h3>
<p>Both posts and pages should be written in markdown, textile, or HTML and may also contain Liquid templating syntax.
Both posts and pages can have meta-data assigned on a per-page basis such as title, url path, as well as arbitrary custom meta-data.</p>

<h3>Working With Posts</h3>
<p><strong>Creating a Post</strong> <br/>
Posts are created by properly formatting a file and placing it the <code>_posts</code> folder.</p>

<p><strong>Formatting</strong><br/>
A post must have a valid filename in the form <code>YEAR-MONTH-DATE-title.MARKUP</code> and be placed in the <code>_posts</code> directory.
If the data format is invalid Jekyll will not recognize the file as a post. The date and title are automatically parsed from the filename of the post file.
Additionally, each file must have <a href="https://github.com/mojombo/jekyll/wiki/YAML-Front-Matter">YAML Front-Matter</a> prepended to its content.
YAML Front-Matter is a valid YAML syntax specifying meta-data for the given file.</p>

<p><strong>Order</strong><br/>
Ordering is an important part of Jekyll but it is hard to specify a custom ordering strategy.
Only reverse chronological and chronological ordering is supported in Jekyll.</p>

<p>Since the date is hard-coded into the filename format, to change the order, you must change the dates in the filenames.</p>
<p><strong>Tags</strong> <br/>
Posts can have tags associated with them as part of their meta-data.
Tags may be placed on posts by providing them in the post&#8217;s YAML front matter.
You have access to the post-specific tags in the templates. These tags also get added to the sitewide collection.</p>

<p><strong>Categories</strong> <br/>
Posts may be categorized by providing one or more categories in the YAML front matter.
Categories offer more significance over tags in that they can be reflected in the URL path to the given post.
Note categories in Jekyll work in a specific way.
If you define more than one category you are defining a category hierarchy &#8220;set&#8221;.
Example:</p>

<pre><code>---
title :  Hello World
categories : [lessons, beginner]
---
</code></pre>

<p>This defines the category hierarchy &#8220;lessons/beginner&#8221;. Note this is <em>one category</em> node in Jekyll.
You won&#8217;t find &#8220;lessons&#8221; and &#8220;beginner&#8221; as two separate categories unless you define them elsewhere as singular categories.</p>

<h3>Working With Pages</h3>
<p><strong>Creating a Page</strong><br/>
Pages are created by properly formatting a file and placing it anywhere in the root directory or subdirectories that do <em>not</em> start with an underscore.</p>

<p><strong>Formatting</strong><br/>
In order to register as a Jekyll page the file must contain <a href="https://github.com/mojombo/jekyll/wiki/YAML-Front-Matter">YAML Front-Matter</a>.
Registering a page means 1) that Jekyll will process the page and 2) that the page object will be available in the <code>site.pages</code> array for inclusion into your templates.</p>

<p><strong>Categories and Tags</strong><br/>
Pages do not compute categories nor tags so defining them will have no effect.</p>

<p><strong>Sub-Directories</strong><br/>
If pages are defined in sub-directories, the path to the page will be reflected in the url.
Example:</p>

<pre><code>.
|-- people
    |-- bob
        |-- essay.html
</code></pre>

<p>This page will be available at <code>http://yourdomain.com/people/bob/essay.html</code></p>
<p><strong>Recommended Pages</strong></p>
<ul>
<li><strong>index.html</strong><br/>
You will always want to define the root index.html page as this will display on your root URL.</li>
<li><strong>404.html</strong><br/>
Create a root 404.html page and GitHub Pages will serve it as your 404 response.</li>
<li><strong>sitemap.html</strong><br/>
Generating a sitemap is good practice for SEO.</li>
<li><strong>about.html</strong><br/>
A nice about page is easy to do and gives the human perspective to your website.</li>
</ul>


<h2>Templates in Jekyll</h2>
<p>Templates are used to contain a page&#8217;s or post&#8217;s content.
All templates have access to a global site object variable: <code>site</code> as well as a page object variable: <code>page</code>.
The site variable holds all accessible content and metadata relative to the site.
The page variable holds accessible data for the given page or post being rendered at that point.</p>

<p><strong>Create a Template</strong><br/>
Templates are created by properly formatting a file and placing it in the <code>_layouts</code> directory.</p>

<p><strong>Formatting</strong><br/>
Templates should be coded in HTML and contain YAML Front Matter.
All templates can contain Liquid code to work with your site&#8217;s data.</p>

<p><strong>Rending Page/Post Content in a Template</strong><br/>
There is a special variable in all templates named : <code>content</code>.
The <code>content</code> variable holds the page/post content including any sub-template content previously defined.
Render the content variable wherever you want your main content to be injected into your template:</p>

<p>Included file &#8216;JB/liquid_raw&#8217; not found in _includes directory</p>
<h3>Sub-Templates</h3>
<p>Sub-templates are exactly templates with the only difference being they
define another &#8220;root&#8221; layout/template within their YAML Front Matter.
This essentially means a template will render inside of another template.</p>

<h3>Includes</h3>
<p>In Jekyll you can define include files by placing them in the <code>_includes</code> folder.
Includes are NOT templates, rather they are just code snippets that get included into templates.
In this way, you can treat the code inside includes as if it was native to the parent template.</p>

<p>Any valid template code may be used in includes.</p>
<h2>Using Liquid for Templating</h2>
<p>Templating is perhaps the most confusing and frustrating part of Jekyll.
This is mainly due to the fact that Jekyll templates must use the Liquid Templating Language.</p>

<h3>What is Liquid?</h3>
<p><a href="https://github.com/Shopify/liquid">Liquid</a> is a secure templating language developed by <a href="http://shopify.com">Shopify</a>.
Liquid is designed for end-users to be able to execute logic within template files
without imposing any security risk on the hosting server.</p>

<p>Jekyll uses Liquid to generate the post content within the final page layout structure and as the primary interface for working with
your site and post/page data.</p>

<h3>Why Do We Have to Use Liquid?</h3>
<p>GitHub uses Jekyll to power <a href="http://pages.github.com/">GitHub Pages</a>.
GitHub cannot afford to run arbitrary code on their servers so they lock developers down via Liquid.</p>

<h3>Liquid is Not Programmer-Friendly.</h3>
<p>The short story is liquid is not real code and its not intended to execute real code.
The point being you can&#8217;t do jackshit in liquid that hasn&#8217;t been allowed explicitly by the implementation.
What&#8217;s more you can only access data-structures that have been explicitly passed to the template.</p>

<p>In Jekyll&#8217;s case it is not possible to alter what is passed to Liquid without hacking the gem or running custom plugins.
Both of which cannot be supported by GitHub Pages.</p>

<p>As a programmer - this is very frustrating.</p>
<p>But rather than look a gift horse in the mouth we are going to
suck it up and view it as an opportunity to work around limitations and adopt client-side solutions when possible.</p>

<p><strong>Aside</strong> <br/>
My personal stance is to not invest time trying to hack liquid. It&#8217;s really unnecessary
<em>from a programmer&#8217;s</em> perspective. That is to say if you have the ability to run custom plugins (i.e. run arbitrary ruby code)
you are better off sticking with ruby. Toward that end I&#8217;ve built <a href="http://github.com/plusjade/mustache-with-jekyll">Mustache-with-Jekyll</a></p>

<h2>Static Assets</h2>
<p>Static assets are any file in the root or non-underscored subfolders that are not pages.
That is they have no valid YAML Front Matter and are thus not treated as Jekyll Pages.</p>

<p>Static assets should be used for images, css, and javascript files.</p>
<h2>How Jekyll Parses Files</h2>
<p>Remember Jekyll is a processing engine. There are two main types of parsing in Jekyll.</p>
<ul>
<li><strong>Content parsing.</strong> <br/>
  This is done with textile or markdown.</li>
<li><strong>Template parsing.</strong> <br/>
This is done with the liquid templating language.</li>
</ul>


<p>And thus there are two main types of file formats needed for this parsing.</p>
<ul>
<li><strong>Post and Page files.</strong><br/>
All content in Jekyll is either a post or a page so valid posts and pages are parsed with markdown or textile.</li>
<li><strong>Template files.</strong>  <br/>
  These files go in <code>_layouts</code> folder and contain your blogs <strong>templates</strong>. They should be made in HTML with the help of Liquid syntax.
  Since include files are simply injected into templates they are essentially parsed as if they were native to the template.</li>
</ul>


<p><strong>Arbitrary files and folders.</strong> <br/>
Files that <em>are not</em> valid pages are treated as static content and pass through
Jekyll untouched and reside on your blog in the exact structure and format they originally existed in.</p>

<h3>Formatting Files for Parsing.</h3>
<p>We&#8217;ve outlined the need for valid formatting using <strong>YAML Front Matter</strong>.
Templates, posts, and pages all need to provide valid YAML Front Matter even if the Matter is empty.
This is the only way Jekyll knows you want the file processed.</p>

<p>YAML Front Matter must be prepended to the top of template/post/page files:</p>
<pre><code>---
layout: post
category : pages
tags : [how-to, jekyll]
---

... contents ...
</code></pre>

<p>Three hyphens on a new line start the Front-Matter block and three hyphens on a new line end the block.
The data inside the block must be valid YAML.</p>

<p>Configuration parameters for YAML Front-Matter is outlined here:
<a href="https://github.com/mojombo/jekyll/wiki/YAML-Front-Matter">A comprehensive explanation of YAML Front Matter</a></p>

<h4>Defining Layouts for Posts and Templates Parsing.</h4>
<p>The <code>layout</code> parameter in the YAML Front Matter defines the template file for which the given post or template should be injected into.
If a template file specifies its own layout, it is effectively being used as a <code>sub-template.</code>
That is to say loading a post file into a template file that refers to another template file with work in the way you&#8217;d expect; as a nested sub-template.</p>

<h2>How Jekyll Generates the Final Static Files.</h2>
<p>Ultimately, Jekyll&#8217;s job is to generate a static representation of your website.
The following is an outline of how that&#8217;s done:</p>

<ol>
<li><p><strong>Jekyll collects data.</strong> <br/>
Jekyll scans the posts directory and collects all posts files as post objects. It then scans the layout assets and collects those and finally scans other directories in search of pages.</p></li>
<li><p><strong>Jekyll computes data.</strong> <br/>
Jekyll takes these objects, computes metadata (permalinks, tags, categories, titles, dates) from them and constructs one
big <code>site</code> object that holds all the posts, pages, layouts, and respective metadata.
At this stage your site is one big computed ruby object.</p></li>
<li><p><strong>Jekyll liquifies posts and templates.</strong><br/>
Next jekyll loops through each post file and converts (through markdown or textile) and <strong>liquifies</strong> the post inside of its respective layout(s).
Once the post is parsed and liquified inside the the proper layout structure, the layout itself is &#8220;liquified&#8221;. <br/>
 <strong>Liquification</strong> is defined as follows: Jekyll initiates a Liquid template, and passes a simpler hash representation of the ruby site object as well as a simpler
hash representation of the ruby post object. These simplified data structures are what you have access to in the templates.</p></li>
<li><p><strong>Jekyll generates output.</strong> <br/>
 Finally the liquid templates are &#8220;rendered&#8221;, thereby processing any liquid syntax provided in the templates
 and saving the final, static representation of the file.</p></li>
</ol>


<p><strong>Notes.</strong><br/>
Because Jekyll computes the entire site in one fell swoop, each template is given access to
a global <code>site</code> hash that contains useful data. It is this data that you&#8217;ll iterate through and format
using the Liquid tags and filters in order to render it onto a given page.</p>

<p>Remember, in Jekyll you are an end-user. Your API has only two components:</p>
<ol>
<li>The manner in which you setup your directory.</li>
<li>The liquid syntax and variables passed into the liquid templates.</li>
</ol>


<p>All the data objects available to you in the templates via Liquid are outlined in the <strong>API Section</strong> of Jekyll-Bootstrap.
You can also read the original documentation here: <a href="https://github.com/mojombo/jekyll/wiki/Template-Data">https://github.com/mojombo/jekyll/wiki/Template-Data</a></p>

<h2>Conclusion</h2>
<p>I hope this paints a clearer picture of what Jekyll is doing and why it works the way it does.
As noted, our main programming constraint is the fact that our API is limited to what is accessible via Liquid and Liquid only.</p>

<p>Jekyll-bootstrap is intended to provide helper methods and strategies aimed at making it more intuitive and easier to work with Jekyll =)</p>
<p><strong>Thank you</strong> for reading this far.</p>
<h2>Next Steps</h2>
<p>Please take a look at <a href=""></a>
or jump right into <a href="">Usage</a> if you&#8217;d like.</p>
</div>


  <footer>
    <p class="meta">
​      


<span class="byline author vcard">Posted by <span class="fn">Nitin Borwankar</span></span>

​      











<time datetime="2011-12-29T00:00:00-08:00" pubdate data-updated="true">Dec 29<span>th</span>, 2011</time>
      

<span class="categories">

    <a class='category' href='/blog/categories/lessons/'>lessons</a>

</span>


    </p>
    
      <div class="sharing">

  <a href="http://twitter.com/share" class="twitter-share-button" data-url="http://nborwankar.github.com/blog/2011/12/29/jekyll-introduction/" data-via="nitin" data-counturl="http://nborwankar.github.com/blog/2011/12/29/jekyll-introduction/" >Tweet</a>

  

</div>


    <p class="meta">


​      
        <a class="basic-alignment right" href="/blog/2012/12/29/first-test-post/" title="Next Post: first test post">first test post &raquo;</a>
      
    </p>
  </footer>
</article>

</div>

<aside class="sidebar">

    <section>
  <h1>Recent Posts</h1>
  <ul id="recent_posts">

      <li class="post">
        <a href="/blog/2012/12/30/hello-world/">Hello World</a>
      </li>
    
      <li class="post">
        <a href="/blog/2012/12/29/first-test-post/">first test post</a>
      </li>
    
      <li class="post">
        <a href="/blog/2011/12/29/jekyll-introduction/">Jekyll Introduction</a>
      </li>

  </ul>
</section>

<section>
  <h1>GitHub Repos</h1>
  <ul id="gh_repos">
    <li class="loading">Status updating...</li>
  </ul>

  <a href="https://github.com/nborwankar">@nborwankar</a> on GitHub
</body>
</html>