
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
									<li><a class="link_toc" href="../../documentacao/vraptor3-guia-de-1-minuto/">1. VRaptor3 - Guia de 1 minuto</a></li>
		
									<li><a class="link_toc" href="../../documentacao/vraptor3-o-guia-inicial-de-10-minutos/">2. VRaptor3 - o guia inicial de 10 minutos</a></li>
		
									<li><a class="link_toc" href="../../documentacao/resources-rest/">3. Resources-Rest</a></li>
		
									<li><a class="link_toc" href="../../documentacao/componentes/">4. Componentes</a></li>
		
									<li><a class="link_toc" href="../../documentacao/conversores/">5. Conversores</a></li>
		
									<li><a class="link_toc" href="../../documentacao/interceptadores/">6. Interceptadores</a></li>
		
									<li><a class="link_toc" href="../../documentacao/validacao/">7. Validação</a></li>
		
									<li><a class="link_toc" href="../../documentacao/view-e-ajax/">8. View e Ajax</a></li>
		
									<li><a class="link_toc" href="../../documentacao/injecao-de-dependencias/">9. Injeção de dependências</a></li>
		
									<li><a class="link_toc" href="../../documentacao/downloading/">10. Downloading</a></li>
		
									<li><a class="link_toc" href="../../documentacao/componentes-utilitarios-opcionais/">11. Componentes Utilitários Opcionais</a></li>
		
									<li><a class="link_toc" href="../../documentacao/configuracoes-avancadas-sobrescrevendo-as-convencoes-e-comportamento-do-vraptor/">12. Configurações avancadas: sobrescrevendo as convenções e comportamento do VRaptor</a></li>
		
									<li><a class="link_toc" href="../../documentacao/spring-joda-time-hibernate-e-google-app-engine/">13. Spring, Joda Time, Hibernate e Google App Engine</a></li>
		
									<li><a class="link_toc" href="../../documentacao/testando-componentes-e-controllers/">14. Testando componentes e controllers</a></li>
		
									<li><a class="link_toc" href="../../documentacao/changelog/">15. ChangeLog</a></li>
		
									<li><a class="link_toc" href="../../documentacao/migrando-do-vraptor2-para-o-vraptor3/">16. Migrando do VRaptor2 para o VRaptor3</a></li>
		
                </ol>
            </div><!-- submenu-->
                        
            <div id="textoCapitulo">
	
		<h2 class="chapter">Migrando do VRaptor2 para o VRaptor3</h2>

		


<h3 class="section">web.xml</h3>
	    	<span class="paragraph">Para migrar aos poucos, basta colocar no seu web.xml:</span>
	    	<div class="xml"><code class="xml"><span class="textag">&lt;context-param&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;param-name&gt;</span><span class="texnormal">br.com.caelum.vraptor.provider</span><span class="textag">&lt;/param-name&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;param-value&gt;</span><span class="texnormal">br.com.caelum.vraptor.vraptor2.Provider</span><span class="textag">&lt;/param-value&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal"></span><span class="textag">&lt;/context-param&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal"><br /></span>
<span class="texnormal"></span><span class="textag">&lt;context-param&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;param-name&gt;</span><span class="texnormal">br.com.caelum.vraptor.packages</span><span class="textag">&lt;/param-name&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;param-value&gt;</span><span class="texnormal">br.com.pacote.base.do.seu.projeto</span><span class="textag">&lt;/param-value&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal"></span><span class="textag">&lt;/context-param&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal"><br /></span>
<span class="texnormal"></span><span class="textag">&lt;filter&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;filter-name&gt;</span><span class="texnormal">vraptor</span><span class="textag">&lt;/filter-name&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;filter-class&gt;</span><span class="texnormal">br.com.caelum.vraptor.VRaptor</span><span class="textag">&lt;/filter-class&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal"></span><span class="textag">&lt;/filter&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal"><br /></span>
<span class="texnormal"></span><span class="textag">&lt;filter-mapping&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;filter-name&gt;</span><span class="texnormal">vraptor</span><span class="textag">&lt;/filter-name&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;url-pattern&gt;</span><span class="texnormal">/*</span><span class="textag">&lt;/url-pattern&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal"></span><span class="textag">&lt;/filter-mapping&gt;</span></code></div>
	    	<span class="paragraph">Lembre-se de tirar a declara&ccedil;&atilde;o antiga do VRaptorServlet do vraptor2, e o seu 
  respectivo mapping.</span>
		

<h3 class="section">migrando de @org.vraptor.annotations.Component para @br.com.caelum.vraptor.Resource</h3>
	    	<span class="paragraph">O correspondente ao @Component do VRaptor2 &eacute; o @Resource do VRaptor3. Portanto, para disponibilizar
os m&eacute;todos de uma classe como l&oacute;gicas &eacute; s&oacute; anot&aacute;-las com @Resource (removendo o @Component).</span>
	    	<span class="paragraph">As conven&ccedil;&otilde;es usadas s&atilde;o um pouco diferentes:</span>
	    	<span class="paragraph">No VRaptor 2:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Component<br />
</span><span class="java4">public class </span><span class="java10">ClientsLogic </span><span class="java8">{<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">form</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; <br />
}</span></code></div>
	    	<span class="paragraph">No VRaptor 3:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">ClientsController </span><span class="java8">{<br />
<br />
&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">form</span><span class="java8">() {<br />
&nbsp;&nbsp; <br />
&nbsp;&nbsp; }<br />
}</span></code></div>
	    	<span class="paragraph">O m&eacute;todo form estar&aacute; acess&iacute;vel pela uri: "/clients/form", e a view padr&atilde;o ser&aacute; a
<code class="inlineCode">WEB-INF/jsp/clients/form.jsp</code>.
Ou seja, o sufixo <code class="inlineCode">Controller</code> &eacute; removido do nome da classe e n&atilde;o tem mais o sufixo
.logic na uri. N&atilde;o &eacute; colocado o resultado "ok" ou "invalid" no nome do jsp.</span>
		

<h3 class="section">@In</h3>
	    	<span class="paragraph">O VRaptor3 gerencia as depend&ecirc;ncias para voc&ecirc;, logo o que voc&ecirc; usava como @In no vraptor2,
basta receber pelo construtor:</span>
	    	<span class="paragraph">No VRaptor 2:</span>
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
	    	<span class="paragraph">No VRaptor 3:</span>
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
	    	<span class="paragraph">E para que isso funcione voc&ecirc; s&oacute; precisa que o seu ClientDao esteja anotado com o 
@br.com.caelum.vraptor.ioc.Component do VRaptor3.</span>
		

<h3 class="section">@Out e getters</h3>
	    	<span class="paragraph">No VRaptor2 voc&ecirc; usava a anota&ccedil;&atilde;o @Out ou um getter para disponibilizar um objeto para a
view. No VRaptor3 basta retornar o objeto, se for um s&oacute;, ou usar um objeto especial para
exp&ocirc;r os objetos para a view. Este objeto &eacute; o Result:</span>
	    	<span class="paragraph">No VRaptor 2:</span>
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
	    	<span class="paragraph">No VRaptor 3:</span>
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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">dao.list</span><span class="java8">()</span><span class="java10">; </span><span class="java3">// o nome ser&aacute; clientList<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">listaDiferente</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java10">result.include</span><span class="java8">(</span><span class="java5">&#34;clients&#34;</span><span class="java10">, dao.list</span><span class="java8">())</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java10">Client show</span><span class="java8">(</span><span class="java10">Long id</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">dao.load</span><span class="java8">(</span><span class="java10">id</span><span class="java8">)</span><span class="java10">; </span><span class="java3">// o nome ser&aacute; &#34;client&#34;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
}</span></code></div>
	    	<span class="paragraph">Quando voc&ecirc; usa o retorno do m&eacute;todo, o vraptor usa o tipo do retorno para determinar
qual vai ser o seu nome na view. No caso de uma classe normal, o nome do objeto ser&aacute;
o nome da classe com a primeira letra min&uacute;scula. No caso de ser uma Collection, o
nome ser&aacute; o nome da classe, com a primeira minuscula, seguido da palavra List.</span>
		

<h3 class="section">views.properties</h3>
	    	<span class="paragraph">No VRaptor3 n&atilde;o existe o arquivo views.properties, embora ele seja suportado no modo de
compatibilidade com o vraptor2. Todos os redirecionamentos s&atilde;o feitos na pr&oacute;pria l&oacute;gica,
usando o Result:</span>
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
	    	<span class="paragraph">Se o redirecionamento for para uma l&oacute;gica, voc&ecirc; pode referenci&aacute;-la diretamente, e os par&acirc;metros passados
para o m&eacute;todo ser&atilde;o usados para chamar a l&oacute;gica.</span>
	    	<span class="paragraph">Se for para uma jsp direto voc&ecirc; pode usar:</span>
	    	<div class="java"><code class="java">
<span class="java10">result.use</span><span class="java8">(</span><span class="java10">Results.page</span><span class="java8">())</span><span class="java10">.forward</span><span class="java8">(</span><span class="java5">&#34;/WEB-INF/jsp/clients/save.ok.jsp&#34;</span><span class="java8">)</span><span class="java10">;</span></code></div>
		

<h3 class="section">Validação</h3>
	    	<span class="paragraph">Voc&ecirc; n&atilde;o precisa criar um m&eacute;todo validateNomeDaLogica para fazer a valida&ccedil;&atilde;o, basta
receber no construtor um objeto do tipo br.com.caelum.vraptor.Validator, e us&aacute;-lo para
sua valida&ccedil;&atilde;o, especificando qual &eacute; a l&oacute;gica para usar quando a valida&ccedil;&atilde;o d&aacute; errado:</span>
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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java10">validator.add</span><span class="java8">(</span><span class="java4">new </span><span class="java10">ValidationMessage</span><span class="java8">(</span><span class="java5">&#34;erro&#34;</span><span class="java10">,</span><span class="java5">&#34;nomeInvalido&#34;</span><span class="java8">))</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java10">validator.onErrorUse</span><span class="java8">(</span><span class="java10">Results.page</span><span class="java8">())</span><span class="java10">.of</span><span class="java8">(</span><span class="java10">ClientsController.</span><span class="java4">class</span><span class="java8">)</span><span class="java10">.form</span><span class="java8">()</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dao.save</span><span class="java8">(</span><span class="java10">client</span><span class="java8">)</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
}</span></code></div>
		

<h3 class="section">Colocando objetos na sessão</h3>
	    	<span class="paragraph">No VRaptor2 bastava colocar um @Out(ScopeType.SESSION) para que o objeto fosse colocado
na sess&atilde;o. Isso n&atilde;o funciona no VRaptor3, pois voc&ecirc; perde totalmente o controle sobre
as vari&aacute;veis que est&atilde;o anotadas desse jeito.</span>
	    	<span class="paragraph">Para colocar objetos na sess&atilde;o no VRaptor3 voc&ecirc; deve fazer uma das duas coisas:</span>
	    	<ul class="list"><li><span class="paragraph">O objeto vai ser acess&iacute;vel apenas por l&oacute;gicas e componentes da aplica&ccedil;&atilde;o, n&atilde;o pelos jsps:</span><div class="java"><code class="java">
<span class="java16">@Component<br />
@SessionScoped<br />
</span><span class="java4">public class </span><span class="java10">MeuObjetoNaSessao </span><span class="java8">{<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">private </span><span class="java10">MeuObjeto meuObjeto;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java3">//getter e setter para meuObjeto<br />
</span><span class="java8">}</span></code></div><span class="paragraph">E nas classes onde voc&ecirc; precisa do MeuObjeto basta receber no construtor o MeuObjetoNaSessao e usar o
	getter e setter pra manipular o MeuObjeto.</span></li><li><span class="paragraph">O objeto vai ser acess&iacute;vel nos jsps tamb&eacute;m:</span><div class="java"><code class="java">
<span class="java16">@Component<br />
@SessionScoped<br />
</span><span class="java4">public class </span><span class="java10">MeuObjetoNaSessao </span><span class="java8">{<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">private </span><span class="java10">HttpSession session;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java10">MeuObjetoNaSessao</span><span class="java8">(</span><span class="java10">HttpSession session</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">this</span><span class="java10">.session = session;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">setMeuObjeto</span><span class="java8">(</span><span class="java10">MeuObjeto objeto</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">this</span><span class="java10">.session.setAttribute</span><span class="java8">(</span><span class="java5">&#34;objeto&#34;</span><span class="java10">, objeto</span><span class="java8">)</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java10">MeuObjeto getMeuObjeto</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">return this</span><span class="java10">.session.getAttribute</span><span class="java8">(</span><span class="java5">&#34;objeto&#34;</span><span class="java8">)</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
}</span></code></div><span class="paragraph">E nas classes basta receber o MeuObjetoNaSessao no construtor e usar o getter e o setter.</span></li></ul>
		

</div><!-- content -->
            
        </div><!-- content cnt -->
    </div><!-- content wrap-->
    
<%@include file="/footer.jsp" %>