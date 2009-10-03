
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
	
		<h2 class="chapter">Dependency injection</h2>

		<span class="paragraph">VRaptor is strongly based on Dependency Injection, since all its internal components are
managed using this technique.</span><span class="paragraph">Tha basic concept behind Dependency Injection (DI) says you should not look for
what you want to access. Instead, it should be provided for you somehow.</span><span class="paragraph">In Java, this is accomplished by passing components to your controller's constructor.
Suppose your clients controller needs to access a clients Dao. Specify that need in your code:</span><div class="java"><code class="java">
<span class="java16">@Component<br />
</span><span class="java4">public class </span><span class="java10">ClientController </span><span class="java8">{<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">private final </span><span class="java10">ClientDao dao;<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java10">ClientController</span><span class="java8">(</span><span class="java10">ClientDao dao</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">this</span><span class="java10">.dao = dao;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
<br />
&nbsp;&nbsp;&nbsp; </span><span class="java16">@Post<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">add</span><span class="java8">(</span><span class="java10">Client client</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">this</span><span class="java10">.dao.add</span><span class="java8">(</span><span class="java10">client</span><span class="java8">)</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp; <br />
}</span></code></div><span class="paragraph">And annotate the ClientDao component as a VRaptor <code class="inlineCode">@Component</code>:</span><div class="java"><code class="java">
<span class="java16">@Component<br />
</span><span class="java4">public class </span><span class="java10">ClientDao </span><span class="java8">{<br />
}</span></code></div><span class="paragraph">From now on, VRaptor will provide your <code class="inlineCode">ClientController</code> with an instance of <code class="inlineCode">ClientDao</code>
when needed. Remember that VRaptor will honor the scope specified by the component.
For example, if <code class="inlineCode">ClientDao</code> had specified Session scope (<code class="inlineCode">@SessionScoped</code>),
only one instance of that component would be created per session. (Note that it is
probably wrong to specify session scope for a Dao, it is only a simple example).</span>


<h3 class="section">ComponentFactory</h3>
	    	<span class="paragraph">Sometimes we want our components to receive other libraries' components.
In that case we are unable to change the libraries's source code in order to
annotate its components with <code class="inlineCode">@Component</code> (and any other changes we may need to do).</span>
	    	<span class="paragraph">The most common example is acquiring a Hibernate Session. We need to create a component
that is responsible for providing Session instances for other components that depend on it.</span>
	    	<span class="paragraph">VRaptor has an interface called <code class="inlineCode">ComponentFactory</code> which allows your classes to
provide components.</span>
	    	<span class="paragraph">Classes implementing that interface define a single method. See the following example,
which starts Hibernate when the component is built and uses that configuration to provide
Session instances for our application:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Component<br />
@ApplicationScoped<br />
</span><span class="java4">public class </span><span class="java10">SessionFactoryCreator </span><span class="java4">implements </span><span class="java10">ComponentFactory&lt;SessionFactory&gt; </span><span class="java8">{<br />
<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">private </span><span class="java10">SessionFactory factory;<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java16">@PostConstruct<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">create</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java10">factory = </span><span class="java4">new </span><span class="java10">AnnotationConfiguration</span><span class="java8">()</span><span class="java10">.configure</span><span class="java8">()</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java10">SessionFactory getInstance</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">factory;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java16">@PreDestroy<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">destroy</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java10">factory.close</span><span class="java8">()</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp; <br />
}<br />
<br />
</span><span class="java16">@Component<br />
@RequestScoped<br />
</span><span class="java4">public class </span><span class="java10">SessionCreator </span><span class="java4">implements </span><span class="java10">ComponentFactory&lt;Session&gt; </span><span class="java8">{<br />
<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">private final </span><span class="java10">SessionFactory factory;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">private </span><span class="java10">Session session;<br />
<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java10">SessionCreator</span><span class="java8">(</span><span class="java10">SessionFactory factory</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">this</span><span class="java10">.factory = factory;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
<br />
&nbsp;&nbsp;&nbsp; </span><span class="java16">@PostConstruct<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">create</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">this</span><span class="java10">.session = factory.openSession</span><span class="java8">()</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java10">Session getInstance</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">session;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
<br />
&nbsp;&nbsp;&nbsp; </span><span class="java16">@PreDestroy<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">destroy</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">this</span><span class="java10">.session.close</span><span class="java8">()</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; <br />
}</span></code></div>
	    	<span class="paragraph">These implementations are already on VRaptor3. Utils chapter will show you how to use them.</span>
		

<h3 class="section">Providers</h3>
	    	<span class="paragraph">Behind the curtains, VRaptor uses a specific DI provider and has out-of-the-box support for PicoContainer or Spring DI.</span>
	    	<span class="paragraph">Each implementation give you all you can find in VRaptor's documentation, but also different
extension points.</span>
		

<h3 class="section">Spring</h3>
	    	<span class="paragraph">When using Spring, you gain all its features and built-in components to use with VRaptor.
In other words, all components that work with Sprint DI/IoC, also work with VRaptor.
In that case, all the annotations.</span>
	    	<span class="paragraph">You don't have to configure anything, since Spring is the default container.</span>
	    	<span class="paragraph">VRaptor will use your Spring configurations, if you have it already configured in your project
(Context listeners and applicationContext.xml). If VRaptor can't find your Spring configuration
you can configure it, as you can see on Advanced Configurations Chapter.</span>
		

<h3 class="section">Pico Container</h3>
	    	<span class="paragraph">When using PicoContainer with VRaptor, you will be able to access Pico directly in order
to do advanced configurations.</span>
	    	<span class="paragraph">If you want PicoContainer to be your application's DI provider, put the following entries
in your web.xml descriptor:</span>
	    	<div class="xml"><code class="xml"><span class="textag">&lt;context-param&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;param-name&gt;</span><span class="texnormal">br.com.caelum.vraptor.provider</span><span class="textag">&lt;/param-name&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;param-value&gt;</span><span class="texnormal">br.com.caelum.vraptor.ioc.pico.PicoProvider</span><span class="textag">&lt;/param-value&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal"></span><span class="textag">&lt;/context-param&gt;</span></code></div>
		

<h3 class="section">Your custom provider</h3>
	    	<span class="paragraph">You can also create your own Provider, either to extend the default implementations with PicoContainer or Spring, or to base your implementation in another DI container you may prefer.</span>
		

</div><!-- content -->
            
        </div><!-- content cnt -->
    </div><!-- content wrap-->
    
<%@include file="/footer.jsp" %>