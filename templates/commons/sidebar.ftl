<!-- Sidebar -->
<section id="sidebar">

    <!-- Intro -->
        <section id="intro">
            <ul class="sidebar-links links">
                <#list config.site_menu as menuItem>
        		 <li>
                    <a href="<#if (config['site_menu_' + menuItem + '_url'] != "/")> ${content.rootpath}${config['site_menu_' + menuItem + '_url']}<#else> ${config.site_host}</#if>">
                       
                            <i class="${config['site_menu_' + menuItem + '_icon']}">&nbsp;</i>${config['site_menu_' + menuItem + '_label']}
                        
                    </a>
                </li>
				</#list>
            </ul>

            <#if (config.sidebar_social_email?has_content) >
                 <ul class="icons">
                     <h3>Contact${config.sidebar_social_email_corp?has_content?then(' Us', '')}</h3>
                     <li><a href="mailto:${config.sidebar_social_email}" title="Email" class="fa fa-envelope"> via Email</a></li><br>
                 </ul>
            </#if>

            <ul class="icons">
                <#if (config.sidebar_social_show?boolean == true)>
                    <h3>Social Networks</h3>
                    <#include "social.ftl">
                </#if>
                <#if (config.render_feed?boolean == true) >
                    <li><a href="${config.feed_file}" type="application/rss+xml"
                        target="_blank" title="RSS" class="fa fa-rss"></a></li>
                </#if>
            </ul>
        </section>

    <!-- Posts List -->
        <section id="recent-posts">
            <ul class="posts">
                <header>
                    <h3>Recent Posts</h3>
                </header>
				<#list posts as sideBarPost1>

                	<#if (sideBarPost1?counter > config.sidebar_postAmount?number) ><#break/></#if>
                    <li>
                        <article>
                            <header>
                                <h3><a href="${content.rootpath}${sideBarPost1.noExtensionUri!sideBarPost1.uri}">${sideBarPost1.title}</a></h3>
                                 <time class="published"
							            datetime='${sideBarPost1.date?string("MMM dd, yyyy")}'>
							            ${sideBarPost1.date?string("MMM dd, yyyy")}</time>
                            </header>
                        </article>
                    </li>
                </#list>

				<#if (published_posts?size > config.sidebar_postAmount?number) >
                    <li>
                        <ul class="actions">
                            <li><a href="${content.rootpath}${config.sidebar_viewMorePostLink?has_content?then(config.sidebar_viewMorePostLink,config.archive_path)}"
                            class="button">View more posts</a></li>
                        </ul>
                    </li>
                </#if>
            </ul>
        </section>

    <!-- Tags List can be show/hide from config-->
    <#if (config.sidebar_tags_show?boolean == true )>
        <section id="tags">
            <ul class="posts">
                <header>
                    <h3>Tags</h3>
                </header>

                <#list alltags as sideBarTag1>
                    <li>
                        <article>
                            <header>
                                <a href="${content.rootpath}${config.tag_path}/${sideBarTag1}${config.output_extension}">${sideBarTag1}</a>
                                <!-- JBake 2.5.1 Issue#357 prevents accessing db, If you are using 2.5.1 or earlier comment below SPAN element. -->
                                <span style="float:right;"> ${db.getPublishedPostsByTag(sideBarTag1).size()} </span>
                            </header>
                        </article>
                    </li>
                </#list>
            </ul>
        </section>
    </#if>

    <#if (config.sidebar_intro_about?? && config.sidebar_intro_about?boolean == true )>
        <!-- About -->
        <section class="blurb">
            <h2>About</h2>
            <p>${config.sidebar_intro_about}</p>

            <ul class="actions">
                <li><a href="${content.rootpath}${config.sidebar_intro_about_learnMore}" class="button">Learn More</a></li>
            </ul>
        </section>
    </#if>

    <section id="footer">
        <p class="copyright">&copy; ${config.site_title}. Design: <a href="http://html5up.net" target="_blank">HTML5 UP</a>. Ported For SSG by <a href="https://github.com/jpescador/hugo-future-imperfect">Julio Pescador</a>. Adapted to JBake by <a href="//github.com/manikmagar" target="_blank">Manik Magar</a>. Baked with <a href="http://jbake.org">JBake ${version}</a>.
        <#if (config.render_sitemap?boolean)><a href="/${config.sitemap_file}" target="_blank">Sitemap</a>.</#if></p>
    </section>
</section>
