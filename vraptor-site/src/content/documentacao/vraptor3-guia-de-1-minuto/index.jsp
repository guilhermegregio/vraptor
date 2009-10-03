
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
	
		<h2 class="chapter">VRaptor3 - Guia de 1 minuto</h2>

		<span class="paragraph">O VRaptor 3 foca em simplicidade e, portanto, todas as funcionalidades que voc&ecirc; ver&aacute; 
t&ecirc;m como primeira meta resolver o problema do programador da maneira menos intrusiva 
poss&iacute;vel em seu c&oacute;digo. </span><span class="paragraph">Tanto para salvar, remover, buscar e atualizar ou ainda funcionalidades que 
costumam ser mais complexas como upload e download de arquivos, resultados em 
formatos diferentes (xml, json, xhtml etc), tudo isso &eacute; feito atrav&eacute;s de funcionalidades 
simples do VRaptor 3, que sempre procuram encapsular <code class="inlineCode">HttpServletRequest</code>,
<code class="inlineCode">Response</code>, <code class="inlineCode">Session</code> e toda a API do <code class="inlineCode">javax.servlet</code>.</span>


<h3 class="section">Começando um projeto</h3>
	    	<span class="paragraph">Voc&ecirc; pode come&ccedil;ar seu projeto a partir do <code class="inlineCode">vraptor-blank-project</code>, que contem as depend&ecirc;ncias
necess&aacute;rias e a configura&ccedil;&atilde;o no <code class="inlineCode">web.xml</code>. Ele pode ser baixado em:</span>
	    	<span class="paragraph"><a class="link" target="_blank" href="http://vraptor.caelum.com.br/download.html">http://vraptor.caelum.com.br/download.html</a></span>
		

<h3 class="section">Um Controller simples</h3>
	    	<span class="paragraph">Chamaremos de <strong class="definition">Controller</strong> as classes contendo a l&oacute;gica de neg&oacute;cio do seu sistema. 
S&atilde;o as classes que alguns frameworks podem vir a chamar de actions ou services, apesar
de n&atilde;o significarem exatamente a mesma coisa.</span>
	    	<span class="paragraph">Com o VRaptor configurado no seu <code class="inlineCode">web.xml</code>, basta criar os seus controllers para receber
as requisi&ccedil;&otilde;es e come&ccedil;ar a construir seu sistema.</span>
	    	<span class="paragraph">Um controller simples seria:</span>
	    	<div class="java"><code class="java">
<span class="java2">/*<br />
 * anotando seu controller com @Resource, seus m&eacute;todos p&uacute;blicos ficarão dispon&iacute;veis <br />
 * para receber requisi&ccedil;ões web.<br />
 */<br />
</span><span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">ClientsController </span><span class="java8">{<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">private </span><span class="java10">ClientDao dao;<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java2">/*<br />
&nbsp;&nbsp;&nbsp;&nbsp; * Voc&ecirc; pode receber as depend&ecirc;ncias da sua classe no construtor, e o VRaptor vai <br />
&nbsp;&nbsp;&nbsp;&nbsp; * se encarregar de criar ou localizar essas depend&ecirc;ncias pra voc&ecirc; e us&aacute;-las pra <br />
&nbsp;&nbsp;&nbsp;&nbsp; * criar o seu controller. Para que o VRaptor saiba como criar o ClientDao voc&ecirc; <br />
&nbsp;&nbsp;&nbsp;&nbsp; * deve anot&aacute;-lo com @Component.<br />
&nbsp;&nbsp;&nbsp;&nbsp; */<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java10">ClientsController</span><span class="java8">(</span><span class="java10">ClientDao dao</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">this</span><span class="java10">.dao = dao;&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java2">/*<br />
&nbsp;&nbsp;&nbsp;&nbsp; * Todos os m&eacute;todos p&uacute;blicos do seu controller estarão acess&iacute;veis via web.<br />
&nbsp;&nbsp;&nbsp;&nbsp; * Por exemplo, o m&eacute;todo form pode ser acessado pela URI /clients/form e<br />
&nbsp;&nbsp;&nbsp;&nbsp; * vai redirecionar para a jsp /WEB-INF/jsp/clients/form.jsp<br />
&nbsp;&nbsp;&nbsp;&nbsp; */<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">form</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java3">// c&oacute;digo que carrega dados para checkboxes, selects, etc<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java2">/*<br />
&nbsp;&nbsp;&nbsp;&nbsp; * Voc&ecirc; pode receber par&acirc;metros no seu m&eacute;todo, e o VRaptor vai tentar popular os<br />
&nbsp;&nbsp;&nbsp;&nbsp; * campos dos par&acirc;metro de acordo com a requisi&ccedil;ão. Se houver na requisi&ccedil;ão:<br />
&nbsp;&nbsp;&nbsp;&nbsp; * custom.name=Lucas<br />
&nbsp;&nbsp;&nbsp;&nbsp; * custom.address=R.Vergueiro<br />
&nbsp;&nbsp;&nbsp;&nbsp; * então teremos os campos name e address do Client custom estarão populados com<br />
&nbsp;&nbsp;&nbsp;&nbsp; * Lucas e R.Vergueiro via getters e setters<br />
&nbsp;&nbsp;&nbsp;&nbsp; * URI: /clients/add<br />
&nbsp;&nbsp;&nbsp;&nbsp; * view: /WEB-INF/jsp/clients/add.jsp<br />
&nbsp;&nbsp;&nbsp;&nbsp; */<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">add</span><span class="java8">(</span><span class="java10">Client custom</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java10">dao.save</span><span class="java8">(</span><span class="java10">custom</span><span class="java8">)</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java2">/*<br />
&nbsp;&nbsp;&nbsp;&nbsp; * O retorno do seu m&eacute;todo &eacute; exportado para a view. Nesse caso, como o retorno &eacute;<br />
&nbsp;&nbsp;&nbsp;&nbsp; * uma lista de clientes, a vari&aacute;vel acess&iacute;vel no jsp ser&aacute; ${clientList}.<br />
&nbsp;&nbsp;&nbsp;&nbsp; * URI: /clients/list<br />
&nbsp;&nbsp;&nbsp;&nbsp; * view: /WEB-INF/jsp/clients/list.jsp<br />
&nbsp;&nbsp;&nbsp;&nbsp; */<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java10">List&lt;Client&gt; list</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">dao.listAll</span><span class="java8">()</span><span class="java10">:<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; </span><span class="java2">/*<br />
&nbsp;&nbsp;&nbsp;&nbsp; * Se o retorno for um tipo simples, o nome da vari&aacute;vel exportada ser&aacute; o nome da <br />
&nbsp;&nbsp;&nbsp;&nbsp; * classe com a primeira letra min&uacute;scula. Nesse caso, como retornou um Client, a <br />
&nbsp;&nbsp;&nbsp;&nbsp; * vari&aacute;vel na jsp ser&aacute; ${client}.<br />
&nbsp;&nbsp;&nbsp;&nbsp; * Devemos ter um par&acirc;metro da requisi&ccedil;ão id=5 por exemplo, e o VRaptor vai<br />
&nbsp;&nbsp;&nbsp;&nbsp; * fazer a conversão do par&acirc;metro em Long, e passar como par&acirc;metro do m&eacute;todo.<br />
&nbsp;&nbsp;&nbsp;&nbsp; * URI: /clients/view<br />
&nbsp;&nbsp;&nbsp;&nbsp; * view: /WEB-INF/jsp/clients/view.jsp<br />
&nbsp;&nbsp;&nbsp;&nbsp; */<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java10">Client view</span><span class="java8">(</span><span class="java10">Long id</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">dao.load</span><span class="java8">(</span><span class="java10">id</span><span class="java8">)</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
}</span></code></div>
	    	<span class="paragraph">Repare como essa classe est&aacute; completamente independente da API de <code class="inlineCode">javax.servlet</code>. 
O c&oacute;digo tamb&eacute;m est&aacute; extremamente simples e f&aacute;cil de ser testado como unidade.
O VRaptor j&aacute; faz v&aacute;rias associa&ccedil;&otilde;es para as URIs como default:</span>
	    	<div class="java"><code class="java">/client/form&nbsp;&nbsp;&nbsp;invoca&nbsp;form()<br />
/client/add&nbsp;&nbsp;&nbsp;&nbsp;invoca&nbsp;add(client)&nbsp;populando&nbsp;o&nbsp;objeto&nbsp;client&nbsp;com&nbsp;os&nbsp;par&acirc;metros&nbsp;da&nbsp;requisi&ccedil;&atilde;o<br />
/clients/list&nbsp;&nbsp;invoca&nbsp;list()&nbsp;e&nbsp;devolve&nbsp;${clientList}&nbsp;ao&nbsp;JSP<br />
/clients/view?id=3&nbsp;&nbsp;invoca&nbsp;view(3l)&nbsp;e&nbsp;devolve&nbsp;${client}&nbsp;ao&nbsp;JSP</code></div>
	    	<span class="paragraph">Mais para a frente veremos como &eacute; f&aacute;cil trocar a URI <code class="inlineCode">/clients/view?id=3</code> para
<code class="inlineCode">/clients/view/3</code>, deixando a URI mais elegante.</span>
	    	<span class="paragraph">O ClientDao ser&aacute; injetado pelo VRaptor, como tamb&eacute;m veremos adiante.
Voc&ecirc; j&aacute; pode passar para o Guia inicial de 10 minutos.</span>
		

</div><!-- content -->
            
        </div><!-- content cnt -->
    </div><!-- content wrap-->
    
<%@include file="/footer.jsp" %>