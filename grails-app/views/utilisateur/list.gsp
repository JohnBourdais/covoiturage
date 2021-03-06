<!-- Sigway - covoiturage
 Copyright (C) 2012 - Laurent Coiffard
 
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/> -->

<%@ page import="fr.sigway.ref.Utilisateur" %>
<!doctype html>

<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'utilisateur.label', default: 'Utilisateur')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span2">
				<sec:ifAllGranted roles="ROLE_PROFIL_ADMIN">
					<div class="well">
						<ul class="nav nav-list">
							<li class="nav-header">\${entityName}</li>
							<li class="active">
								<g:link class="list" action="list">
									<i class="icon-list"></i>
									<g:message code="default.list.label" args="[entityName]" />
								</g:link>
							</li>
							<li>
								<g:link class="create" action="create">
									<i class="icon-plus"></i>
									<g:message code="default.create.label" args="[entityName]" />
								</g:link>
							</li>
							<li>
								<g:link controller="logout" action="index" >
									<i class="icon-off"></i>
									<g:message code="accueil.deconnexion"/>
								</g:link>
							</li>
						</ul>
					</div>
				</sec:ifAllGranted>
			</div>

			<div class="span8">
				
				<div class="page-header">
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
						
							<g:sortableColumn property="email" title="${message(code: 'utilisateur.email.label', default: 'Email')}" />
						
							<g:sortableColumn property="nom" title="${message(code: 'utilisateur.nom.label', default: 'Nom')}" />
						
							<g:sortableColumn property="prenom" title="${message(code: 'utilisateur.prenom.label', default: 'Prenom')}" />
						
							<th class="header"><g:message code="utilisateur.adresseDomicile.label" default="Adresse Domicile" /></th>
						
							<th class="header"><g:message code="utilisateur.adresseDestination.label" default="Adresse Destination" /></th>
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${utilisateurInstanceList}" var="utilisateurInstance">
						<tr>
						
							<td>${fieldValue(bean: utilisateurInstance, field: "email")}</td>
						
							<td>${fieldValue(bean: utilisateurInstance, field: "nom")}</td>
						
							<td>${fieldValue(bean: utilisateurInstance, field: "prenom")}</td>
						
							<td>${fieldValue(bean: utilisateurInstance, field: "adresseDomicile")}</td>
						
							<td>${fieldValue(bean: utilisateurInstance, field: "adresseDestination")}</td>
						
							<td class="link">
								<g:link action="show" id="${utilisateurInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination pagination-centered">
					<bootstrap:paginate total="${utilisateurInstanceTotal}" />
				</div>
			</div>
			
			<div class="span2">
			</div>

		</div>
	</body>
</html>
