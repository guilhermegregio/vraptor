
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
	
		<h2 class="chapter">Migrating from VRaptor2 to VRaptor3</h2>

		


<h3 class="section">web.xml</h3>
	    	<span class="paragraph">In order to migrate, in small steps, you'll only need to put on your web.xml:</span>
	    	<div class="xml"><code class="xml"><span class="textag">&lt;context-param&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;param-name&gt;</span><span class="texnormal">br.com.caelum.vraptor.provider</span><span class="textag">&lt;/param-name&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;param-value&gt;</span><span class="texnormal">br.com.caelum.vraptor.vraptor2.Provider</span><span class="textag">&lt;/param-value&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal"></span><span class="textag">&lt;/context-param&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal"><br /></span>
<span class="texnormal"></span><span class="textag">&lt;context-param&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;param-name&gt;</span><span class="texnormal">br.com.caelum.vraptor.packages</span><span class="textag">&lt;/param-name&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="texcomment">&lt;!--&nbsp;Your&nbsp;base&nbsp;package&nbsp;here&nbsp;--&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;param-value&gt;</span><span class="texnormal">com.companyname.projectname</span><span class="textag">&lt;/param-value&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal"></span><span class="textag">&lt;/context-param&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal"></span><span class="textag">&lt;filter&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;filter-name&gt;</span><span class="texnormal">vraptor</span><span class="textag">&lt;/filter-name&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;filter-class&gt;</span><span class="texnormal">br.com.caelum.vraptor.VRaptor</span><span class="textag">&lt;/filter-class&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal"></span><span class="textag">&lt;/filter&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal"><br /></span>
<span class="texnormal"></span><span class="textag">&lt;filter-mapping&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;filter-name&gt;</span><span class="texnormal">vraptor</span><span class="textag">&lt;/filter-name&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;url-pattern&gt;</span><span class="texnormal">/*</span><span class="textag">&lt;/url-pattern&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal"></span><span class="textag">&lt;/filter-mapping&gt;</span></code></div>
	    	<span class="paragraph">Don't forget to remove the old VRaptorServlet declaration from VRaptor2, and its
  respective servlet-mapping.</span>
		

<h3 class="section">Migration from @org.vraptor.annotations.Component to @br.com.caelum.vraptor.Resource</h3>
	    	<span class="paragraph">VRaptor2's @Component correspondent in VRaptor3 is @Resource. Therefore, in order to
make logic classes accessible, just annotate them with @Resource (removing the @Component).</span>
	    	<span class="paragraph">The conventions used are slightly different:</span>
	    	<span class="paragraph">In VRaptor2:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Component<br />
</span><span class="java4">public class </span><span class="java10">ClientsLogic </span><span class="java8">{<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">form</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; <br />
}</span></code></div>
	    	<span class="paragraph">In VRaptor 3:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">ClientsController </span><span class="java8">{<br />
<br />
&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">form</span><span class="java8">() {<br />
&nbsp;&nbsp; <br />
&nbsp;&nbsp; }<br />
}</span></code></div>
	    	<span class="paragraph">The form method will be accessible from the URI: "/clients/form", and the default view
will be <code class="inlineCode">WEB-INF/jsp/clients/form.jsp</code>.</span>
	    	<span class="paragraph">Which means, the suffix <code class="inlineCode">Controller</code> is removed from the class name and there is no more
.logic at the end of the URI. Also, the result jsp doesn't have either "ok" or "invalid" on
its name.</span>
		

<h3 class="section">@In</h3>
	    	<span class="paragraph">VRaptor3 manages the dependencies for you, so, what you were used to annotate with @In on
VRaptor2, you'll only need to receive as constructor arguments:</span>
	    	<span class="paragraph">In VRaptor 2:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Component<br />
</span><span class="java4">public class </span><span class="java10">ClientsLogic </span><span class="java8">{<br />
&nbsp;&nbsp;&nbsp; </span><span class="java16">@In<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">private </span><span class="java10">ClientDao dao;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">form</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; <br />
}</span></code></div>
	    	<span class="paragraph">In VRaptor 3:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">ClientsController </span><span class="java8">{<br />
<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">private final </span><span class="java10">ClientDao dao;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java10">ClientsController</span><span class="java8">(</span><span class="java10">ClientDao dao</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">this</span><span class="java10">.dao = dao;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">form</span><span class="java8">() {<br />
&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; }<br />
}</span></code></div>
	    	<span class="paragraph">In order for this to work, you only need that your ClientDao is annotated with VRaptor3's 
@br.com.caelum.vraptor.ioc.Component.</span>
		

<h3 class="section">@Out and getters</h3>
	    	<span class="paragraph">In VRaptor2 you used either the @Out annotation or a getter method to make and object accessible
to the view. In VRaptor3 you only need to return the specified object, if it's only one, or
make use of a special object which exposes your objects to the view. This object is the Result.</span>
	    	<span class="paragraph">In VRaptor 2:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Component<br />
</span><span class="java4">public class </span><span class="java10">ClientsLogic </span><span class="java8">{<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">private </span><span class="java10">Collection&lt;Client&gt; list;<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">list</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">this</span><span class="java10">.list = dao.list</span><span class="java8">()</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java10">Collection&lt;Client&gt; getClientList</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">return this</span><span class="java10">.list;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
<br />
&nbsp;&nbsp;&nbsp; </span><span class="java16">@Out<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">private </span><span class="java10">Client client;<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">show</span><span class="java8">(</span><span class="java10">Long id</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">this</span><span class="java10">.client = dao.load</span><span class="java8">(</span><span class="java10">id</span><span class="java8">)</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp; <br />
}</span></code></div>
	    	<span class="paragraph">In VRaptor 3:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">ClientsController </span><span class="java8">{<br />
<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">private final </span><span class="java10">ClientDao dao;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">private final </span><span class="java10">Result result;<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java10">ClientsController</span><span class="java8">(</span><span class="java10">ClientDao dao, Result result</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">this</span><span class="java10">.dao = dao;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">this</span><span class="java10">.result = result;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java10">Collection&lt;Client&gt; list</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">dao.list</span><span class="java8">()</span><span class="java10">; </span><span class="java3">// the name will be &#34;clientList&#34;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">listaDiferente</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java10">result.include</span><span class="java8">(</span><span class="java5">&#34;clients&#34;</span><span class="java10">, dao.list</span><span class="java8">())</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java10">Client show</span><span class="java8">(</span><span class="java10">Long id</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">dao.load</span><span class="java8">(</span><span class="java10">id</span><span class="java8">)</span><span class="java10">; </span><span class="java3">// the name will be &#34;client&#34;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
}</span></code></div>
	    	<span class="paragraph">When your method's return type isn't void, VRaptor uses that type to find out which
will be the object's name on the view. 
When not using the Result object, the name of the exposed object depends on the method's return type.
If the return type is a Collection, the object name will be the name of the 
object contained by the Collection followed by the word List. In the above example, the object would be named 'clientList'.
Otherwise, if the return type is a single object, the exposed object's name will be the name of the class
with lowercase characters.</span>
		

<h3 class="section">views.properties</h3>
	    	<span class="paragraph">In VRaptor3 there's no views.properties file, although it is supported when using VRaptor3's
compatibility mode. Thus, all redirections are made on the underlying logic, using the Result object.</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">ClientsController </span><span class="java8">{<br />
<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">private final </span><span class="java10">ClientDao dao;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">private final </span><span class="java10">Result result;<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java10">ClientsController</span><span class="java8">(</span><span class="java10">ClientDao dao, Result result</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">this</span><span class="java10">.dao = dao;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">this</span><span class="java10">.result = result;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java10">Collection&lt;Client&gt; list</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">dao.list</span><span class="java8">()</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">save</span><span class="java8">(</span><span class="java10">Client client</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java10">dao.save</span><span class="java8">(</span><span class="java10">client</span><span class="java8">)</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result.use</span><span class="java8">(</span><span class="java10">Results.logic</span><span class="java8">())</span><span class="java10">.redirectTo</span><span class="java8">(</span><span class="java10">ClientsController.</span><span class="java4">class</span><span class="java8">)</span><span class="java10">.list</span><span class="java8">()</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
}</span></code></div>
	    	<span class="paragraph">If it's redirection to a logic, you can refer to it directly, and the given parameters will be passed to
the called logic.</span>
	    	<span class="paragraph">If you want to forward to a JSP page, you can use:</span>
	    	<div class="java"><code class="java">
<span class="java10">result.use</span><span class="java8">(</span><span class="java10">Results.page</span><span class="java8">())</span><span class="java10">.forward</span><span class="java8">(</span><span class="java5">&#34;/WEB-INF/jsp/clients/save.ok.jsp&#34;</span><span class="java8">)</span><span class="java10">;</span></code></div>
		

<h3 class="section">Validation</h3>
	    	<span class="paragraph">You don't need to create a method called validateLogicName in order to do the validation,
you only need to receive the br.com.caelum.vraptor.Validator object in your logic's
constructor, and use it to do your validation, specifying which logic to go when
your validation fails.</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">ClientsController </span><span class="java8">{<br />
<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">private final </span><span class="java10">ClientDao dao;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">private final </span><span class="java10">Result result;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">private final </span><span class="java10">Validator validator;<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java10">ClientsController</span><span class="java8">(</span><span class="java10">ClientDao dao, Result result, Validator validator</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">this</span><span class="java10">.dao = dao;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">this</span><span class="java10">.result = result;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">this</span><span class="java10">.validator = validator;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">form</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">save</span><span class="java8">(</span><span class="java10">Client client</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">if </span><span class="java8">(</span><span class="java10">client.getName</span><span class="java8">() </span><span class="java10">== </span><span class="java4">null</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java10">validator.add</span><span class="java8">(</span><span class="java4">new </span><span class="java10">ValidationMessage</span><span class="java8">(</span><span class="java5">&#34;error&#34;</span><span class="java10">,</span><span class="java5">&#34;invalidName&#34;</span><span class="java8">))</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java10">validator.onErrorUse</span><span class="java8">(</span><span class="java10">Results.page</span><span class="java8">())</span><span class="java10">.of</span><span class="java8">(</span><span class="java10">ClientsController.</span><span class="java4">class</span><span class="java8">)</span><span class="java10">.form</span><span class="java8">()</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dao.save</span><span class="java8">(</span><span class="java10">client</span><span class="java8">)</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
}</span></code></div>
		

<h3 class="section">Putting objects on Session</h3>
	    	<span class="paragraph">On VRaptor2 it was enough an @Out(ScopeType.SESSION) for putting an object on HttpSession.
It doesn't work on VRaptor3, because this way you lose control on your variables.
So in VRaptor3 you have to do one of this two approaches:</span>
	    	<ul class="list"><li><span class="paragraph">Your object will be accessed only by components and controllers, not by jsps:</span><div class="java"><code class="java">
<span class="java16">@Component<br />
@SessionScoped<br />
</span><span class="java4">public class </span><span class="java10">SessionMyObject </span><span class="java8">{<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">private </span><span class="java10">MyObject myobject;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java3">//getter and setter<br />
</span><span class="java8">}</span></code></div><span class="paragraph">And you receive on your classes constructors a SessionMyObject, and use getters and setters to
	handle the MyObject on session.</span></li><li><span class="paragraph">The object will be accessed in jsps too:</span><div class="java"><code class="java">
<span class="java16">@Component<br />
@SessionScoped<br />
</span><span class="java4">public class </span><span class="java10">SessionMyObject </span><span class="java8">{<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">private </span><span class="java10">HttpSession session;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java10">SessionMyObject</span><span class="java8">(</span><span class="java10">HttpSession session</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">this</span><span class="java10">.session = session;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">setMyObject</span><span class="java8">(</span><span class="java10">MyObject object</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">this</span><span class="java10">.session.setAttribute</span><span class="java8">(</span><span class="java5">&#34;object&#34;</span><span class="java10">, object</span><span class="java8">)</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java10">MeuObjeto getMeuObjeto</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">return this</span><span class="java10">.session.getAttribute</span><span class="java8">(</span><span class="java5">&#34;objeto&#34;</span><span class="java8">)</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
}</span></code></div></li></ul>
		

</div><!-- content -->
            
        </div><!-- content cnt -->
    </div><!-- content wrap-->
    
<%@include file="/footer.jsp" %>