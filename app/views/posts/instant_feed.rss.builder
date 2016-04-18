#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Instant Articles Rails Example"
    xml.author "Derek Kean"
    xml.description "Example Instant Articles Rails CMS Adapter"
    xml.link "http://www.derekkean.com"
    xml.language "en"
    xml.copyright "MIT License"

    for post in @feed_posts
      xml.item do
        if post.title
          xml.title post.title
        else
          xml.title ""
        end
        xml.author post.user.name
        xml.link request.base_url+"/"+post.user.name+"/"+post.slug
        xml.content:encoded do
          
          xml.cdata! "<head>
            <meta charset='utf-8'>
            <meta property='op:markup_version' content='v1.0'>

            <!-- The URL of the web version of your article --> 
            <link rel='canonical' href='"+request.base_url+"/"+post.user.slug+"/"+post.slug+"'>
            
            <!-- The style to be used for this article --> 
            <meta property='fb:article_style' content='default'>
            <meta property='og:title' content='"+post.title+"'>
            <meta property='og:description' content='"+post.description+"'>
          </head>

          <body>
            <article>
              <header>
                <!-- The cover image shown inside your article --> 
                <figure>
                  <img src='http://placehold.it/800x600.png' />
                </figure>
                
                <!-- The title and subtitle shown in your article -->
                <h1>"+post.title+"</h1>
                <h2>"+post.description+"</h2>
                
                <h3>"+post.kicker+"</h3>

                <!-- The author of your article -->
                <address>
                  <a rel='author' href='"+request.base_url+"/users/"+post.user.slug+"'>"+post.user.name+"</a>
                </address>

                <!-- The published and last modified time stamps -->
                <time class='op-published' dateTime='"+post.published_at.to_s+"'>"+post.published_at.to_s+"</time>
                <time class='op-modified' dateTime='"+post.updated_at.to_s+"'>"+post.updated_at.to_s+"</time>
              </header>

              "+post.content+"

              <figure class='op-tracker'>
                <iframe hidden>
                  <script>
                    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                    })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

                    ga('create', 'GACODE', 'auto');
                    ga('send', 'pageview');
                  </script>

                </iframe>
              </figure>

              <footer>
                  <!-- Copyright details for your article -->
                  <small></small>
              </footer>

            </article>
          </body>"

        end
        xml.description post.description
        xml.pubDate post.published_at
        xml.guid post.id
      end
    end
  end
end