
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
	
		<h2 class="chapter">Resources-Rest</h2>

		


<h3 class="section">O que são Resources?</h3>
	    	<span class="paragraph">Resources s&atilde;o o que poder&iacute;amos pensar como recursos a serem disponibilizados para 
acesso pelos nossos clientes.</span>
	    	<span class="paragraph">No caso de uma aplica&ccedil;&atilde;o Web baseada no VRaptor, um recurso deve ser anotado com a 
anota&ccedil;&atilde;o <code class="inlineCode">@Resource</code>. Assim que o programador insere tal anota&ccedil;&atilde;o em seu c&oacute;digo, 
todos os m&eacute;todos p&uacute;blicos desse recurso se tornam acess&iacute;veis atrav&eacute;s de chamadas do 
tipo GET a URIs espec&iacute;ficas.</span>
	    	<span class="paragraph">O exemplo a seguir mostra um recurso chamado <code class="inlineCode">ClienteController</code> que possui m&eacute;todos
para diversas funcionalidades ligadas a um cliente.</span>
	    	<span class="paragraph">Simplesmente criar essa classe e os m&eacute;todos faz com que as urls <strong class="definition">/cliente/adiciona</strong>,
<strong class="definition">/cliente/lista</strong>, <strong class="definition">/cliente/visualiza</strong>, <strong class="definition">/cliente/remove</strong> e <strong class="definition">/cliente/atualiza</strong> 
sejam disponibilizadas, cada uma invocando o respectivo m&eacute;todo em sua classe.</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">ClienteController </span><span class="java8">{<br />
 <br />
&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">adiciona</span><span class="java8">(</span><span class="java10">Cliente cliente</span><span class="java8">) {<br />
<br />
&nbsp; }<br />
&nbsp; <br />
&nbsp; </span><span class="java4">public </span><span class="java10">List&lt;Cliente&gt; lista</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
&nbsp; <br />
&nbsp; </span><span class="java4">public </span><span class="java10">Cliente visualiza</span><span class="java8">(</span><span class="java10">Cliente perfil</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
 <br />
&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">remove</span><span class="java8">(</span><span class="java10">Cliente cliente</span><span class="java8">) {<br />
<br />
&nbsp; </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
&nbsp; <br />
<br />
&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">atualiza</span><span class="java8">(</span><span class="java10">Cliente cliente</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp; </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
&nbsp; <br />
}</span></code></div>
		

<h3 class="section">Parâmetros dos métodos</h3>
	    	<span class="paragraph">Voc&ecirc; pode receber par&acirc;metros nos m&eacute;todos dos seus controllers, e se o objeto
usar a conven&ccedil;&atilde;o de java beans (getters e setters para os atributos da classe),
voc&ecirc; pode usar pontos para navegar entre os atributos. Por exemplo, no m&eacute;todo:</span>
	    	<div class="java"><code class="java">
<span class="java4">public </span><span class="java9">void </span><span class="java10">atualiza</span><span class="java8">(</span><span class="java10">Cliente cliente</span><span class="java8">) {<br />
&nbsp;&nbsp; </span><span class="java3">//...<br />
</span><span class="java8">}</span></code></div>
	    	<span class="paragraph">voc&ecirc; pode passar como par&acirc;metro na requisi&ccedil;&atilde;o:</span>
	    	<div class="java"><code class="java">cliente.id=3<br />
cliente.nome=Fulano<br />
cliente.usuario.login=fulano</code></div>
	    	<span class="paragraph">e os campos correspondentes, navegando via getters e setters a partir do cliente,
ser&atilde;o setados.</span>
	    	<span class="paragraph">Se um atributo do objeto ou par&acirc;metro do m&eacute;todo for uma lista (List&lt;&gt; ou array), voc&ecirc;
pode passar v&aacute;rios par&acirc;metros usando colchetes e &iacute;ndices:</span>
	    	<div class="java"><code class="java">cliente.telefones[0]=(11)&nbsp;5571-2751&nbsp;#no&nbsp;caso&nbsp;de&nbsp;ser&nbsp;uma&nbsp;lista&nbsp;de&nbsp;String<br />
cliente.dependentes[0].id=1&nbsp;#no&nbsp;caso&nbsp;de&nbsp;ser&nbsp;qualquer&nbsp;objeto,&nbsp;voc&ecirc;&nbsp;pode&nbsp;continuar&nbsp;a&nbsp;navega&ccedil;&atilde;o<br />
cliente.dependentes[3].id=1&nbsp;#os&nbsp;&iacute;ndices&nbsp;n&atilde;o&nbsp;precisam&nbsp;ser&nbsp;sequenciais<br />
cliente.dependentes[0].nome=Cicrano&nbsp;#se&nbsp;usar&nbsp;o&nbsp;mesmo&nbsp;&iacute;ndice,&nbsp;vai&nbsp;ser&nbsp;setado&nbsp;no&nbsp;mesmo&nbsp;objeto<br />
clientes[1].id=23&nbsp;#funciona&nbsp;se&nbsp;voc&ecirc;&nbsp;receber&nbsp;uma&nbsp;lista&nbsp;de&nbsp;clientes&nbsp;no&nbsp;m&eacute;todo</code></div>
	    	<div class="box"><h3>Reflection no nome dos par&acirc;metros</h3>
<span class="paragraph">Infelizmente, o Java n&atilde;o realiza reflection em cima de par&acirc;metros, esses dados n&atilde;o ficam
dispon&iacute;veis em bytecode (a n&atilde;o ser se compilado em debug mode, por&eacute;m &eacute; algo opcional). Isso
faz com que a maioria dos frameworks que precisam desse tipo de inform&ccedil;&atilde;o criem uma anota&ccedil;&atilde;o
pr&oacute;pria para isso, o que polui muito o c&oacute;digo (exemplo no JAX-WS, onde &eacute; comum encontrar um
m&eacute;todo como o acima com a assinatura  <code class="inlineCode">void add(@WebParam(name="cliente") Cliente cliente)</code>.</span><span class="paragraph">O VRaptor tira proveito do framework Paranamer (<a class="link" target="_blank" href="http://paranamer.codehaus.org">http://paranamer.codehaus.org</a>), que consegue 
tirar essa informa&ccedil;&atilde;o atrav&eacute;s de pr&eacute; compila&ccedil;&atilde;o ou dos dados de debug, evitando criar mais uma 
anota&ccedil;&atilde;o. Alguns dos desenvolvedores do VRaptor tamb&eacute;m participam no desenvolvimento do Paranamer.</span></div>
		

<h3 class="section">Escopos</h3>
	    	<span class="paragraph">Por vezes voc&ecirc; deseja compartilhar um componente entre todos os usu&aacute;rios,
entre todas as requisi&ccedil;&otilde;es de um mesmo usu&aacute;rio ou a cada requisi&ccedil;&atilde;o de um usu&aacute;rio.</span>
	    	<span class="paragraph">Para definir em que escopo o seu componente vive, basta utilizar as anota&ccedil;&otilde;es
<code class="inlineCode">@ApplicationScoped</code>, <code class="inlineCode">@SessionScoped</code> e <code class="inlineCode">@RequestScoped</code>.</span>
	    	<span class="paragraph">Caso nenhuma anota&ccedil;&atilde;o seja utilizada, o VRaptor assume que seu componente ficar&aacute;
no escopo de request, isto &eacute;, voc&ecirc; ter&aacute; um novo componente a cada nova requisi&ccedil;&atilde;o.</span>
		

<h3 class="section">Http Methods</h3>
	    	<span class="paragraph">O ideal &eacute; definir uma URI espec&iacute;fica para diversos m&eacute;todos HTTP diferentes, como
GET, POST, PUT etc.</span>
	    	<span class="paragraph">Para atingir esse objetivo, utilizamos as anota&ccedil;&otilde;es <code class="inlineCode">@Get</code>, <code class="inlineCode">@Post</code>, <code class="inlineCode">@Delete</code> 
etc juntamente com a anota&ccedil;&atilde;o <code class="inlineCode">@Path</code> que permite configurar uma URI diferente da 
URI padr&atilde;o.</span>
	    	<span class="paragraph">O exemplo a seguir altera os padr&otilde;es de URI do <code class="inlineCode">ClienteController</code> para utilizar
duas URIs distintas, com diversos m&eacute;todos HTTP:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">ClienteController </span><span class="java8">{<br />
<br />
&nbsp; </span><span class="java16">@Path</span><span class="java8">(</span><span class="java5">&#34;/cliente&#34;</span><span class="java8">)<br />
&nbsp; </span><span class="java16">@Post <br />
&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">adiciona</span><span class="java8">(</span><span class="java10">Cliente cliente</span><span class="java8">) {<br />
&nbsp; }<br />
&nbsp; <br />
&nbsp; </span><span class="java16">@Path</span><span class="java8">(</span><span class="java5">&#34;/&#34;</span><span class="java8">)<br />
&nbsp; </span><span class="java4">public </span><span class="java10">List&lt;Cliente&gt; lista</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
<br />
&nbsp; </span><span class="java16">@Get<br />
&nbsp; @Path</span><span class="java8">(</span><span class="java5">&#34;/cliente&#34;</span><span class="java8">)&nbsp; <br />
&nbsp; </span><span class="java4">public </span><span class="java10">Cliente visualiza</span><span class="java8">(</span><span class="java10">Cliente cliente</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
 <br />
&nbsp; </span><span class="java16">@Delete<br />
&nbsp; @Path</span><span class="java8">(</span><span class="java5">&#34;/cliente&#34;</span><span class="java8">)<br />
&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">remove</span><span class="java8">(</span><span class="java10">Cliente cliente</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp; </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
&nbsp; <br />
&nbsp; </span><span class="java16">@Put<br />
&nbsp; @Path</span><span class="java8">(</span><span class="java5">&#34;/cliente&#34;</span><span class="java8">)<br />
&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">atualiza</span><span class="java8">(</span><span class="java10">Cliente cliente</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp; </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
&nbsp; <br />
}</span></code></div>
	    	<span class="paragraph">Como voc&ecirc; pode notar, utilizamos os m&eacute;todos HTTP + uma URI espec&iacute;fica para
identificar cada um dos m&eacute;todos de minha classe Java.</span>
	    	<span class="paragraph">No momento de criar os links e formul&aacute;rios HTML devemos tomar um cuidado <strong class="definition">muito
importante</strong> pois os browsers s&oacute; d&atilde;o suporte aos m&eacute;todos <em class="italic">POST</em> e <em class="italic">GET</em> atrav&eacute;s 
de formul&aacute;rios hoje em dia.</span>
	    	<span class="paragraph">Por isso, voc&ecirc; dever&aacute; criar as requisi&ccedil;&otilde;es para m&eacute;todos do tipo <em class="italic">DELETE</em>, <em class="italic">PUT</em> etc
atrav&eacute;s de JavaScript ou passando um par&acirc;metro extra, chamado <strong class="definition">_method</strong>.</span>
	    	<span class="paragraph">Esse par&acirc;metro sobrescrever&aacute; o m&eacute;todo HTTP real sendo invocado.</span>
	    	<span class="paragraph">O exemplo a seguir mostra um link para o m&eacute;todo visualiza de cliente:</span>
	    	<div class="xml"><code class="xml"><span class="textag">&lt;a</span>&nbsp;<span class="texattrib">href=</span><span class="texvalue">"/cliente?cliente.id=5"</span><span class="textag">&gt;</span><span class="texnormal">ver&nbsp;cliente&nbsp;5</span><span class="textag">&lt;/a&gt;</span></code></div>
	    	<span class="paragraph">Agora um exemplo de como invocar o m&eacute;todo de adicionar um cliente:</span>
	    	<div class="xml"><code class="xml"><span class="textag">&lt;form</span>&nbsp;<span class="texattrib">action=</span><span class="texvalue">"/cliente"</span>&nbsp;<span class="texattrib">method=</span><span class="texvalue">"post"</span><span class="textag">&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;input</span>&nbsp;<span class="texattrib">name=</span><span class="texvalue">"cliente.nome"</span>&nbsp;<span class="textag">/&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;input</span>&nbsp;<span class="texattrib">type=</span><span class="texvalue">"submit"</span>&nbsp;<span class="textag">/&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal"></span><span class="textag">&lt;/form&gt;</span></code></div>
	    	<span class="paragraph">E, note que para permitir a remo&ccedil;&atilde;o atrav&eacute;s do m&eacute;todo <em class="italic">DELETE</em>, temos que usar o 
par&acirc;metro <code class="inlineCode">_method</code>, uma vez que o browser n&atilde;o suporta ainda tais requisi&ccedil;&otilde;es:</span>
	    	<div class="xml"><code class="xml"><span class="textag">&lt;form</span>&nbsp;<span class="texattrib">action=</span><span class="texvalue">"/cliente"</span>&nbsp;<span class="texattrib">method=</span><span class="texvalue">"post"</span><span class="textag">&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;input</span>&nbsp;<span class="texattrib">name=</span><span class="texvalue">"_method"</span>&nbsp;<span class="texattrib">value=</span><span class="texvalue">"DELETE"</span>&nbsp;<span class="texattrib">type=</span><span class="texvalue">"hidden"</span>&nbsp;<span class="textag">/&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;input</span>&nbsp;<span class="texattrib">name=</span><span class="texvalue">"cliente.id"</span>&nbsp;<span class="texattrib">value=</span><span class="texvalue">"5"</span>&nbsp;<span class="texattrib">type=</span><span class="texvalue">"hidden"</span>&nbsp;<span class="textag">/&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="textag">&lt;input</span>&nbsp;<span class="texattrib">type=</span><span class="texvalue">"submit"</span>&nbsp;<span class="texattrib">value=</span><span class="texvalue">"remover&nbsp;cliente&nbsp;5"</span>&nbsp;<span class="textag">/&gt;</span><span class="texnormal"><br /></span>
<span class="texnormal"></span><span class="textag">&lt;/form&gt;</span></code></div>
		

<h3 class="section">@Path</h3>
	    	<span class="paragraph">A anota&ccedil;&atilde;o <code class="inlineCode">@Path</code> permite que voc&ecirc; customize as URIs de acesso a seus m&eacute;todos.
O uso b&aacute;sico dessa anota&ccedil;&atilde;o &eacute; feito atrav&eacute;s de uma URI fixa. O exemplo a seguir mostra
a customiza&ccedil;&atilde;o de uma URI para um m&eacute;todo, que somente receber&aacute; requisi&ccedil;&otilde;es do tipo
<em class="italic">POST</em> na URI <strong class="definition">/cliente</strong>:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">ClienteController </span><span class="java8">{<br />
<br />
&nbsp; </span><span class="java16">@Path</span><span class="java8">(</span><span class="java5">&#34;/cliente&#34;</span><span class="java8">)<br />
&nbsp; </span><span class="java16">@Post <br />
&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">adiciona</span><span class="java8">(</span><span class="java10">Cliente cliente</span><span class="java8">) {<br />
&nbsp; }<br />
&nbsp;&nbsp;&nbsp; <br />
}</span></code></div>
	    	<span class="paragraph"><strong class="title">Path com inje&ccedil;&atilde;o de vari&aacute;veis</strong></span>
	    	<span class="paragraph">Em diversos casos desejamos que a <em class="italic">uri</em> que identifica meu recurso tenha
como parte de seu valor, por exemplo, o identificador &uacute;nico de meu recurso.</span>
	    	<span class="paragraph">Suponha o exemplo de um controle de clientes onde meu identificador &uacute;nico (chave
prim&aacute;ria) &eacute; um n&uacute;mero, podemos ent&atilde;o mapear as uris <em class="italic">/cliente/{cliente.id}</em>
para a visualiza&ccedil;&atilde;o de cada cliente.</span>
	    	<span class="paragraph">Isto &eacute;, se acessarmos a uri <em class="italic">/cliente/2</em>, o m&eacute;todo <strong class="definition">visualiza</strong> ser&aacute; invocado
e o par&acirc;metro <em class="italic">cliente.id</em> ser&aacute; setado para <strong class="definition">2</strong>. Caso a uri <em class="italic">/cliente/1717</em> seja
acessada, o mesmo m&eacute;todo ser&aacute; invocado com o valor <strong class="definition">1717</strong>.</span>
	    	<span class="paragraph">Dessa maneira criamos uris &uacute;nicas para identificar recursos diferentes do nosso sistema.
Veja o exemplo citado:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">ClienteController </span><span class="java8">{<br />
<br />
&nbsp; </span><span class="java16">@Get<br />
&nbsp; @Path</span><span class="java8">(</span><span class="java5">&#34;/cliente/{cliente.id}&#34;</span><span class="java8">)&nbsp; <br />
&nbsp; </span><span class="java4">public </span><span class="java10">Cliente visualiza</span><span class="java8">(</span><span class="java10">Cliente cliente</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
&nbsp; <br />
}</span></code></div>
	    	<span class="paragraph">Voc&ecirc; pode ir al&eacute;m e setar diversos par&acirc;metros atrav&eacute;s da uri:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">ClienteController </span><span class="java8">{<br />
<br />
&nbsp; </span><span class="java16">@Get<br />
&nbsp; @Path</span><span class="java8">(</span><span class="java5">&#34;/cliente/{cliente.id}/visualiza/{secao}&#34;</span><span class="java8">)&nbsp; <br />
&nbsp; </span><span class="java4">public </span><span class="java10">Cliente visualiza</span><span class="java8">(</span><span class="java10">Cliente cliente, String secao</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
&nbsp; <br />
}</span></code></div>
	    	<span class="paragraph"><strong class="title">Paths com *</strong></span>
	    	<span class="paragraph">Voc&ecirc; tamb&eacute;m pode utilizar o * como m&eacute;todo de sele&ccedil;&atilde;o para a sua uri. O exemplo a
seguir ignora qualquer coisa ap&oacute;s a palavra <em class="italic">foto/</em> :</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">ClienteController </span><span class="java8">{<br />
<br />
&nbsp; </span><span class="java16">@Get<br />
&nbsp; @Path</span><span class="java8">(</span><span class="java5">&#34;/cliente/{cliente.id}/foto/*&#34;</span><span class="java8">)&nbsp; <br />
&nbsp; </span><span class="java4">public </span><span class="java10">File foto</span><span class="java8">(</span><span class="java10">Cliente cliente</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
&nbsp; <br />
}</span></code></div>
	    	<span class="paragraph">E agora o mesmo c&oacute;digo, mas utilizado para baixar uma foto espec&iacute;fica de um cliente:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">ClienteController </span><span class="java8">{<br />
<br />
&nbsp; </span><span class="java16">@Get<br />
&nbsp; @Path</span><span class="java8">(</span><span class="java5">&#34;/cliente/{cliente.id}/foto/{foto.id}&#34;</span><span class="java8">)&nbsp; <br />
&nbsp; </span><span class="java4">public </span><span class="java10">File foto</span><span class="java8">(</span><span class="java10">Cliente cliente, Foto foto</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
&nbsp; <br />
}</span></code></div>
	    	<span class="paragraph">Por vezes voc&ecirc; deseja que o par&acirc;metro a ser setado inclua tamb&eacute;m <strong class="definition">/</strong>s. Para isso
voc&ecirc; deve utilizar o padr&atilde;o {...*}:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">ClienteController </span><span class="java8">{<br />
<br />
&nbsp; </span><span class="java16">@Get<br />
&nbsp; @Path</span><span class="java8">(</span><span class="java5">&#34;/cliente/{cliente.id}/download/{path*}&#34;</span><span class="java8">)&nbsp; <br />
&nbsp; </span><span class="java4">public </span><span class="java10">File download</span><span class="java8">(</span><span class="java10">Cliente cliente, String path</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">return </span><span class="java10">...<br />
&nbsp; </span><span class="java8">}<br />
&nbsp; <br />
}</span></code></div>
	    	<span class="paragraph"><strong class="title">Definindo prioridades para seus paths</strong></span>
	    	<span class="paragraph">&Eacute; poss&iacute;vel que algumas das nossas URIs possa ser tratada por mais de um m&eacute;todo da classe:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">PostController </span><span class="java8">{<br />
<br />
&nbsp; </span><span class="java16">@Get<br />
&nbsp; @Path</span><span class="java8">(</span><span class="java5">&#34;/post/{post.autor}&#34;</span><span class="java8">)<br />
&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">mostra</span><span class="java8">(</span><span class="java10">Post post</span><span class="java8">) { </span><span class="java10">... </span><span class="java8">}<br />
<br />
&nbsp; </span><span class="java16">@Get<br />
&nbsp; @Path</span><span class="java8">(</span><span class="java5">&#34;/post/atual&#34;</span><span class="java8">)<br />
&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">atual</span><span class="java8">() { </span><span class="java10">... </span><span class="java8">}<br />
}</span></code></div>
	    	<span class="paragraph">A uri <code class="inlineCode">/post/atual</code> pode ser tratada tanto pelo m&eacute;todo <code class="inlineCode">mostra</code>, quanto pelo <code class="inlineCode">atual</code>.
Mas eu quero que quando seja exatamente <code class="inlineCode">/post/atual</code> o m&eacute;todo executado seja o atual. 
O que eu quero &eacute; que o VRaptor teste primeiro o path do m&eacute;todo <code class="inlineCode">atual</code>,
para n&atilde;o correr o risco de cair no m&eacute;todo <code class="inlineCode">mostra</code>.</span>
	    	<span class="paragraph">Para fazer isso, podemos definir prioridades para os <code class="inlineCode">@Path</code>s, assim o VRaptor vai testar
primeiro os paths com maior prioridade, ou seja, valor menor de prioridade:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Resource<br />
</span><span class="java4">public class </span><span class="java10">PostController </span><span class="java8">{<br />
<br />
&nbsp; </span><span class="java16">@Get<br />
&nbsp; @Path</span><span class="java8">(</span><span class="java10">priority = </span><span class="java7">2</span><span class="java10">, value = </span><span class="java5">&#34;/post/{post.autor}&#34;</span><span class="java8">)<br />
&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">mostra</span><span class="java8">(</span><span class="java10">Post post</span><span class="java8">) { </span><span class="java10">... </span><span class="java8">}<br />
<br />
&nbsp; </span><span class="java16">@Get<br />
&nbsp; @Path</span><span class="java8">(</span><span class="java10">priority = </span><span class="java7">1</span><span class="java10">, value = </span><span class="java5">&#34;/post/atual&#34;</span><span class="java8">)<br />
&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">atual</span><span class="java8">() { </span><span class="java10">... </span><span class="java8">}<br />
}</span></code></div>
	    	<span class="paragraph">Assim, o path "/post/atual" vai ser testado antes do "/post/{post.autor}", e o VRaptor vai fazer
o que a gente gostaria que ele fizesse.</span>
	    	<span class="paragraph">Voc&ecirc; n&atilde;o precisa definir prioridades se tivermos as uris: <code class="inlineCode">/post/{post.id}</code> e <code class="inlineCode">/post/atual</code>,
pois na <code class="inlineCode">/post/{post.id}</code> o vraptor s&oacute; vai aceitar n&uacute;meros.</span>
		

<h3 class="section">RoutesConfiguration</h3>
	    	<span class="paragraph">Por fim, a maneira mais avan&ccedil;ada de configurar rotas de acesso aos seus recursos
&eacute; atrav&eacute;s de um <strong class="definition">RoutesConfiguration</strong>.</span>
	    	<span class="paragraph">Esse componente deve ser configurado no escopo de aplica&ccedil;&atilde;o e implementar o m&eacute;todo config:</span>
	    	<div class="java"><code class="java">
<span class="java16">@Component<br />
@ApplicationScoped<br />
</span><span class="java4">public class </span><span class="java10">CustomRoutes </span><span class="java4">implements </span><span class="java10">RoutesConfiguration </span><span class="java8">{<br />
<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">config</span><span class="java8">(</span><span class="java10">Router router</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp; }<br />
<br />
}</span></code></div>
	    	<span class="paragraph">De posse de um <strong class="definition">Router</strong>, voc&ecirc; pode definir rotas para acesso a m&eacute;todos e, o
melhor de tudo, &eacute; que a configura&ccedil;&atilde;o &eacute; refactor-friendly, isto &eacute;, se voc&ecirc; alterar
o nome de um m&eacute;todo, a configura&ccedil;&atilde;o tamb&eacute;m altera, mas mantem a mesma <em class="italic">uri</em> :</span>
	    	<div class="java"><code class="java">
<span class="java16">@Component<br />
@ApplicationScoped<br />
</span><span class="java4">public class </span><span class="java10">CustomRoutes </span><span class="java4">implements </span><span class="java10">RoutesConfiguration </span><span class="java8">{<br />
<br />
&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">config</span><span class="java8">(</span><span class="java10">Router router</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">new </span><span class="java10">Rules</span><span class="java8">(</span><span class="java10">router</span><span class="java8">) {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java4">public </span><span class="java9">void </span><span class="java10">routes</span><span class="java8">() {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java10">routeFor</span><span class="java8">(</span><span class="java5">&#34;/&#34;</span><span class="java8">)</span><span class="java10">.is</span><span class="java8">(</span><span class="java10">ClienteController.</span><span class="java4">class</span><span class="java8">)</span><span class="java10">.list</span><span class="java8">()</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; routeFor</span><span class="java8">(</span><span class="java5">&#34;/cliente/random&#34;</span><span class="java8">)</span><span class="java10">.is</span><span class="java8">(</span><span class="java10">ClienteController.</span><span class="java4">class</span><span class="java8">)</span><span class="java10">.aleatorio</span><span class="java8">()</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</span><span class="java10">;<br />
&nbsp;&nbsp;&nbsp; </span><span class="java8">}<br />
<br />
}</span></code></div>
	    	<span class="paragraph">Voc&ecirc; pode tamb&eacute;m colocar par&acirc;metros na uri e eles v&atilde;o ser populados diretamente nos
par&acirc;metros do m&eacute;todo. Voc&ecirc; pode ainda adicionar restri&ccedil;&otilde;es para esses par&acirc;metros:</span>
	    	<div class="java"><code class="java">
<span class="java3">// O m&eacute;todo mostra recebe um Cliente que tem um id<br />
</span><span class="java10">routeFor</span><span class="java8">(</span><span class="java5">&#34;/cliente/{cliente.id}&#34;</span><span class="java8">)</span><span class="java10">.is</span><span class="java8">(</span><span class="java10">ClienteController.</span><span class="java4">class</span><span class="java8">)</span><span class="java10">.mostra</span><span class="java8">(</span><span class="java4">null</span><span class="java8">)</span><span class="java10">;<br />
</span><span class="java3">// Se eu quiser garantir que o parametro seja um n&uacute;mero:<br />
</span><span class="java10">routeFor</span><span class="java8">(</span><span class="java5">&#34;/cliente/{cliente.id}&#34;</span><span class="java8">)</span><span class="java10">.withParameter</span><span class="java8">(</span><span class="java5">&#34;cliente.id&#34;</span><span class="java8">)</span><span class="java10">.matching</span><span class="java8">(</span><span class="java5">&#34;\\d+&#34;</span><span class="java8">)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span class="java10">.is</span><span class="java8">(</span><span class="java10">ClienteController.</span><span class="java4">class</span><span class="java8">)</span><span class="java10">.mostra</span><span class="java8">(</span><span class="java4">null</span><span class="java8">)</span><span class="java10">;</span></code></div>
	    	<span class="paragraph">Por fim, voc&ecirc; pode escolher o nome da classe e o nome do m&eacute;todo em tempo de execu&ccedil;&atilde;o,
que permite criar rotas extremamente gen&eacute;ricas:</span>
	    	<div class="java"><code class="java">
<span class="java10">routeFor</span><span class="java8">(</span><span class="java5">&#34;/{webResource}/facaAlgo/{webMethod}&#34;</span><span class="java8">)</span><span class="java10">.is</span><span class="java8">(<br />
&nbsp;&nbsp;&nbsp; </span><span class="java10">type</span><span class="java8">(</span><span class="java5">&#34;br.com.caelum.nomedoprojeto.{webResource}&#34;</span><span class="java8">)</span><span class="java10">, <br />
&nbsp;&nbsp;&nbsp; method</span><span class="java8">(</span><span class="java5">&#34;{webMethod}&#34;</span><span class="java8">))</span><span class="java10">;</span></code></div>
		

</div><!-- content -->
            
        </div><!-- content cnt -->
    </div><!-- content wrap-->
    
<%@include file="/footer.jsp" %>