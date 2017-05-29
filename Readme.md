<html>
<head>
  <meta charset="utf-8" />
</head>
<body>
    <header>
        <section style="color:blue;float:left;padding-right:20px;">
         <img src="../imgs/dockerNetbeans.png" style="width:150px;height:100px;">
         </section>
        <section style="color:navy;float:left;padding-left:15px;">
        <h1>docker-netbeans-images</h1>
        <citation>
        Docker image for netbeans 8.2 et Java 8.</citation>
        </section>
    </header>
<section style="color:navy;float:left;padding-left:15px;">
<article>
<h1 id='idtitle1'>I. What is this?</h1>
<p>Docker image for netbeans 8.2 et Java 8.</p>
<h1 id='idtitle2'>II. How to use it?</h1>
<p>_* Pull the image_</p>
<code><pre>docker pull bhntools/docker-netbeans:latest</pre></code>
<p>_* Run the image_</p>
<code><pre>docker run -d -e DISPLAY=$(ifconfig vboxnet0 | grep 'inet' | cut -d' ' -f2):0 -it bhntools/docker-netbeans:latest </pre></code>

<h1 id='idtitle4'> III. Issues and Contributing</h1> 
<h2> III.1/ Support</h2>
<p>
If you are having issues, please let me know.
</p>
<h2> III.2/ Contribute</h2>
<p>Bug reports, bug fixes, and new features are always welcome.<br>
* Issue Tracker: <a href="https://github.com/NajlaBH/ProJavas/issues">github</a><br>
* Source Code: <a href="https://github.com/NajlaBH/ProJavas/pulls">github</a></p>
<h2 id='idtitleE'> III.3/ Authors and Maintainers</h2>
<p>BEN HASSINE NAJLA : <a href="MAILTO:bhndevtools@gmail.com?Subject=DockerBIum">bhndevtools@gmail.com</a></p>

<section style="font: bold;color:green;align:center;font-size:small;">
<footer>
BHNtools-copyright2017©
<br>
<span style="color:black;">MIT License.</span>
</footer>
</section>
</article>
</section>
<aside style='float:right; font:bold; color:navy; align:center; font-size:small; border: 1.5px solid; border-radius:20px; width:200px;'>
 <div style='font:bold;width:250px;padding-left:5px; padding-right:5px; margin-left:5px;'>Topics<br>
<a href=#idtitle1>I. What is this?</a>
<br>
<a href=#idtitle2>II. How to use it?</a>
<br>
<a href=#idtitle3>III. Resources</a>
<br>
<a href=#idtitle4>IV. Issues and Contributing</a>
</div>
</aside>
</body>
</html>
