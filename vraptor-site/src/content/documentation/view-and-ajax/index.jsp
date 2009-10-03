
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/header.jsp">
	<jsp:param name="extras" value='
		<link href="../includes/css/java.css" rel="stylesheet" type="text/css" media="screen" />
		<link href="../includes/css/xml2html.css" rel="stylesheet" type="text/css" media="screen" />
		<link href="../includes/css/style.css" rel="stylesheet" type="text/css" media="screen" />
	'/>
</jsp:include><div id="contentWrap">
    	<div id="contentDocumentacao">
        	<h2><span>documentação</span></h2>
            <h3>documentação toda em português, configuração, migração e utilização.</h3>
            
            <div id="subMenuDoc">
            	<img id="positionTop" src="../includes/images/subMenuTop-trans.png" />
                <img id="positionBottom" src="../includes/images/subMenuBottom-trans.png" />
            	<ol type="1">
									<li><a class="link_toc" href="../../documentation/vraptor3-one-minute-guide/">1. VRaptor3 - One minute guide</a></li>
		
									<li><a class="link_toc" href="../../documentation/vraptor3-ten-minutes-guide/">2. VRaptor3 - Ten minutes guide</a></li>
		
									<li><a class="link_toc" href="../../documentation/resources-rest/">3. Resources-Rest</a></li>
		
									<li><a class="link_toc" href="../../documentation/components/">4. Components</a></li>
		
									<li><a class="link_toc" href="../../documentation/converters/">5. Converters</a></li>
		
									<li><a class="link_toc" href="../../documentation/interceptors/">6. Interceptors</a></li>
		
									<li><a class="link_toc" href="../../documentation/validation/">7. Validation</a></li>
		
									<li><a class="link_toc" href="../../documentation/view-and-ajax/">8. View and Ajax</a></li>
		
									<li><a class="link_toc" href="../../documentation/dependency-injection/">9. Dependency injection</a></li>
		
									<li><a class="link_toc" href="../../documentation/downloading/">10. Downloading</a></li>
		
									<li><a class="link_toc" href="../../documentation/utility-components/">11. Utility Components</a></li>
		
									<li><a class="link_toc" href="../../documentation/advanced-configurations-overriding-vraptor-s-behavior-and-conventions/">12. Advanced configurations: overriding VRaptor's behavior and conventions</a></li>
		
									<li><a class="link_toc" href="../../documentation/testing-components-and-controllers/">13. Testing components and controllers</a></li>
		
									<li><a class="link_toc" href="../../documentation/changelog/">14. ChangeLog</a></li>
		
									<li><a class="link_toc" href="../../documentation/migrating-from-vraptor2-to-vraptor3/">15. Migrating from VRaptor2 to VRaptor3</a></li>
		
                </ol>
            </div><!-- submenu-->
                        
            <div id="textoCapitulo">
	
		<h2 class="chapter">View and Ajax</h2>

		


<h3 class="section">Custom PathResolver</h3>
	    	<span class="paragraph">By default, VRaptor tries to render your views following the convention:</span>
	    	<div class="java"><code class="java">
<span class="java4">public class </span><span class="java10">ClientsController </span><span class="java8">{<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">list</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java3">//...<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
}</span></code></div>
	    	<span class="paragraph">The method listed above will render the view <code class="inlineCode">/WEB-INF/jsp/clients/list.jsp</code>.</span>
	    	<span class="paragraph">However, we don't always want it to behave that way, specially if we need to use some
template engine like Freemarker or Velocity. In that case, we need to change the convention.</span>
	    	<span class="paragraph">An easy way of changing that convention is extending the <code class="inlineCode">DefaultPathResolver</code> class:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Component<br />
</span><span class="java4">public class </span><span class="java10">FreemarkerPathResolver </span><span class="java4">extends </span><span class="java10">DefaultPathResolver </span><span class="java8">{<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">protected </span><span class="java10">String getPrefix</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java5">&#34;/WEB-INF/freemarker/&#34;</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">protected </span><span class="java10">String getExtension</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java5">&#34;ftl&#34;</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
}</span></code></div>
	    	<span class="paragraph">That way, the logic would try to render the view <code class="inlineCode">/WEB-INF/freemarker/clients/list.ftl</code>.
If that solution is not enough, you can implement the <code class="inlineCode">PathResolver</code> interface and do whatever convention you wish.
Don't forget to annotate your new classe with <code class="inlineCode">@Component</code>.</span>
		

<h3 class="section">View</h3>
	    	<span class="paragraph">If you want to change a specific logic's view, you can use the <code class="inlineCode">Result</code> object:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">ClientsController </span><span class="java8">{<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">private final </span><span class="java10">Result result;<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java10">ClientsController</span><span class="java8">(</span><span class="java10">Result result</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">this</span><span class="java10">.result = result;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">list</span><span class="java8">() {}<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">save</span><span class="java8">(</span><span class="java10">Client client</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java3">//...<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">this</span><span class="java10">.result.use</span><span class="java8">(</span><span class="java10">Results.logic</span><span class="java8">())</span><span class="java10">.redirectTo</span><span class="java8">(</span><span class="java10">ClientsController.</span><span class="java4">class</span><span class="java8">)</span><span class="java10">.list</span><span class="java8">()</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
}</span></code></div>
	    	<span class="paragraph">By default, there are these view implementations:</span>
	    	<ul class="list"><li><span class="paragraph">Results.logic(), redirects to any other logic in the application.</span></li><li><span class="paragraph">Results.page(), redirects directly to a page, that can be a jsp, an html, or any
	URI relative to the web application directory or the application context.</span></li><li><span class="paragraph">Results.http(), sends HTTP protocol informations, like status codes and headers.</span></li><li><span class="paragraph">Results.nothing(), simply returns the HTTP success code (HTTP 200 OK).</span></li></ul>
		

<h3 class="section">Redirect and forward</h3>
	    	<span class="paragraph">In VRaptor3, you can either redirect or forward the user to another logic or page.
The main difference between redirecting and forwarding is that the former happens
at client side, while the latter happens at server side.</span>
	    	<span class="paragraph">A good redirect use is the pattern 'redirect-after-post', for example, when you add
a client and you want to return to the client listing page, but you want to avoid
the user to accidentally resend all data by refreshing (F5) the page.</span>
	    	<span class="paragraph">An example of forwarding is when you have some data validation that fails, usually you
want the user to remain on the form with all the previously filled data.</span>
		

<h3 class="section">Accepts and the _format parameter</h3>
	    	<span class="paragraph">Many times you need to render different formats for the same logic. For example,
we want to return a JSON object instead of an HTML page.
In order to do that, we can define the request's Accepts header to accept the desired
format, or we can pass a <code class="inlineCode">_format</code> paramenter in the request.</span>
	    	<span class="paragraph">If the specified format is JSON, the default rendered view will be: <code class="inlineCode">/WEB-INF/jsp/{controller}/{logic}.json.jsp</code>,
which means, in general, the rendered view will be: <code class="inlineCode">/WEB-INF/jsp/{controller}/{logic}.{format}.jsp</code>.
If the format is HTML, then you won't need to specify it in the file name.</span>
	    	<span class="paragraph">The <code class="inlineCode">_format</code> parameter has a higher priority over the Accepts header.</span>
		

<h3 class="section">Ajax: building on the view</h3>
	    	<span class="paragraph">In order to return a JSON object to the view, your logic must make that object available somehow.
Just like the following example, your <code class="inlineCode">/WEB-INF/jsp/clients/load.json.jsp</code>:</span>
	    	<div class="java"><code class="java">{&nbsp;name:&nbsp;'${client.name}',&nbsp;id:&nbsp;'${client.id}'&nbsp;}</code></div>
	    	<span class="paragraph">And in the controller:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">ClientsController </span><span class="java8">{<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">private final </span><span class="java10">Result result;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">private final </span><span class="java10">ClientDao dao;<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java10">ClientsController</span><span class="java8">(</span><span class="java10">Result result, ClientDao dao</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">this</span><span class="java10">.result = result;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">this</span><span class="java10">.dao = dao;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">load</span><span class="java8">(</span><span class="java10">Client client</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java10">result.include</span><span class="java8">(</span><span class="java5">&#34;client&#34;</span><span class="java10">, dao.load</span><span class="java8">(</span><span class="java10">client</span><span class="java8">))</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
}</span></code></div>
		

</div><!-- content -->
            
        </div><!-- content cnt -->
    </div><!-- content wrap-->
    
<%@include file="/footer.jsp" %>