{include file="admin/inc/top.tpl"}
{include file="tpl_js/delete_multiple.js.tpl"}

<!-- BREADCRUMBS -->
	<ul class="breadcrumb">
	    <li><a href="#">Sub-Menu Admin</a><span class="divider"></span></li>
	    <li class="active">List/Edit</li>
	</ul> 
<!-- BREADCRUMBS -->

<!-- ADAUGARE -->
<div class="form-group col-md-5 panel-info">
	<div class="panel-heading">Adauga</div>
	<br />
	<form class="form-inline" role="form" name="form_act" action="index.php?obj={$smarty.get.obj}&action=add_upd" method="post" onSubmit="return formValidate('form_act',1);">
		<input type="hidden" name="act" value="{$form_act.act}">
		<input type="hidden" name="{$idName}" value="{$form_act.$idName}">
		<div class="row">
		  	<div class="form-group col-md-12">
			    <label class="control-label col-md-4" for="menuadmin_priority">Menu{if isset($form_act.menuadmin_id)}{$form_act.menuadmin_id}{/if}</label>
				<select name="menuadmin_id" style="width:180px;" class="form-control">
					<option value="" class="color3">select menu</option>
					{html_options values=$menuadminList.0 selected=$form_act.menuadmin_id output=$menuadminList.1}
				</select>
		  	</div>
	  	</div>
	  	<div class="row">
		  	<div class="form-group col-md-12">
			    <label class="control-label col-md-4" for="smenuadmin_name">Sub-Menu Name</label>
			    <input type="text" class="form-control col-md-4" id="smenuadmin_name" name="smenuadmin_name" value="{if isset($form_act.smenuadmin_name)}{$form_act.smenuadmin_name}{/if}">
		  	</div>
	  	</div>
	  	<div class="row">
		  	<div class="form-group col-md-12">
			    <label class="control-label col-md-4" for="smenuadmin_link">Sub-Menu Link</label>
			    <input type="text" class="form-control col-md-4" id="smenuadmin_link" name="smenuadmin_link" value="{if isset($form_act.smenuadmin_link)}{$form_act.smenuadmin_link}{/if}">
		  	</div>
	  	</div>
	  	<div class="row">
		  	<div class="form-group col-md-12">
			    <label class="control-label col-md-4" for="smenuadmin_priority">Priority</label>
			    <input type="text" class="form-control col-md-4" id="smenuadmin_priority" name="smenuadmin_priority" value="{if isset($form_act.smenuadmin_priority)}{$form_act.smenuadmin_priority}{/if}">
		  	</div>
	  	</div>
	  	<div class="row">
		  	<div class="form-group col-md-12">
			    <label class="checkbox-label col-md-4">Status Master</label>
				<input class="col-md-4" type="checkbox" name="smenuadmin_master" id="inlineCheckbox1" value="1" {if isset($form_act.smenuadmin_master) && $form_act.smenuadmin_master!=="0"}checked{/if}> 
		  	</div>
	  	</div>
	  	<div class="row">
		  	<div class="form-group col-md-12">
			    <label class="checkbox-label col-md-4">Activ</label>
				<input class="col-md-4" type="checkbox" name="smenuadmin_active" id="inlineCheckbox1" value="1" {if isset($form_act.smenuadmin_active) && $form_act.smenuadmin_active!=="0"}checked{/if}> 
		  	</div>
	  	</div>
	  	<div class="row container">
		  	<div class="form-group col-md-12">
			    <div class="checkbox">
				  <label>inapoi la formul de editare
				    <input type="checkbox" name="backToEditForm">
				  </label>
				</div>
				<button type="submit" class="btn btn-primary">salveaza</button>
				{if $form_act.act=='upd'}
					<button type="button" class="btn btn-danger" onClick="window.location='index.php?obj={$smarty.get.obj}&action={$smarty.get.action}'">anuleaza</button>
				{/if}
		  	</div>
	  	</div>
	</form>
</div>
<!-- ADAUGARE -->

<!-- MOTOR DE CAUTARE -->
<div class="form-group col-md-5 panel-info">
	<div class="panel-heading">Motor de cautare</div>
	<br />
	<form class="form-inline" role="form" name="form_search" action="index.php?obj={$smarty.get.obj}&action={$smarty.get.action}" method="post" onSubmit="return formValidate('form_search', 0);">
		<input type="hidden" name="act" value="search">
		<div class="row">
			<div class="form-group col-md-12">
			    <label class="control-label col-md-4" for="menuadmin_id">Menu Name</label>
			    <select name="menuadmin_id" id="menuadmin_id" style="width:180px;" class="form-control">
					<option value=""></option>
					{html_options values=$menuadminList.0 selected=$moduleSession.search.menuadmin_id output=$menuadminList.1}
				</select>
		  	</div>
	  	</div>
		<div class="row">
			<div class="form-group col-md-12">
			    <label class="control-label col-md-4" for="smenuadmin_name">Sub-Menu Name</label>
			    <input type="text" class="form-control col-md-4" id="smenuadmin_name" name="smenuadmin_name" value="{if isset($moduleSession.search.smenuadmin_name)}{$moduleSession.search.smenuadmin_name}{/if}">
		  	</div>
	  	</div>
	  	<div class="row">
		  	<div class="form-group col-md-12">
			    <label class="control-label col-md-4" for="menuadmin_priority">Activ</label>
			    <select name="menuadmin_active" style="width:180px;" class="form-control">
					<option value=""></option>
					<option value="1" {if $moduleSession.search.menuadmin_active==1}selected{/if}>{#txtYes#}</option>
					<option value="0" {if $moduleSession.search.menuadmin_active==="0"}selected{/if}>{#txtNo#}</option>
				</select>
		  	</div>
	  	</div>
	  	<div class="row">
		  	<div class="form-group col-md-12">
			    <label class="control-label col-md-4" for="menuadmin_active">Status Menu</label>
			    <select name="menuadmin_active" id="menuadmin_active" style="width:180px;" class="form-control">
					<option value=""></option>
					<option value="1" {if $moduleSession.search.menuadmin_active==1}selected{/if}>{#txtYes#}</option>
					<option value="0" {if $moduleSession.search.menuadmin_active==="0"}selected{/if}>{#txtNo#}</option>
				</select>
		  	</div>
	  	</div>
	  	<div class="row">
		  	<div class="form-group col-md-12">
			    <label class="control-label col-md-4" for="smenuadmin_active">Sub-Menu</label>
				<select name="smenuadmin_active" id="smenuadmin_active" style="width:180px;" class="form-control">
					<option value=""></option>
					<option value="1" {if $moduleSession.search.smenuadmin_active==1}selected{/if}>{#txtYes#}</option>
					<option value="0" {if $moduleSession.search.smenuadmin_active==="0"}selected{/if}>{#txtNo#}</option>
				</select>
		  	</div>
	  	</div>
	  	<div class="row container">
		  	<div class="form-group col-md-12">
		  		Paginare: <input type="text" name="noRowsDisplayed" class="form-control" value="{$moduleSession.paging.noRowsDisplayed}" style="width: 50px;"> inregistrari pe pagina
		  	</div>
	  	</div>
	  	<div class="row pull-right">
		  	<div class="form-group col-md-12">
				<button type="submit" class="btn btn-primary">cauta</button>
				<button type="button" class="btn btn-danger" onClick="formReset('form_search')">reseteaza</button>
		  	</div>
	  	</div>
	</form>
</div>
<!-- MOTOR DE CAUTARE -->

{if $moduleSession.paging.noRowsResult > 0}
	<div class="form-group col-md-12 panel-info">
		<div class="pull-right">{#pgNoRecords#}: {$moduleSession.paging.noRowsResult}</div>
	</div>
	{if $listRecords|@count>0}
		<table class="table table-hover table-bordered"> 
			<form name="form_list" method="post">
				<input type="hidden" name="act" value="">
				<thead>
					<tr> 
						<th>{#txtNoCrt#}</th>								
						<th>Sub-Menu Name</th> 
						<th>Sub-Menu Link</th>
						<th>Priority Display</th> 
						<th>Status Master</th>
						<th>Status</th>
						<th width="25">{#txtEdit#}</th>
						<th width="50" style="vertical-align: middle;">
							<span id="btnDel"><img src="{$smarty.const.IMAGES_URL}admin/utile/del.gif" style="filter:Alpha(Opacity=20)" align="absmiddle"></span>
							<input type="checkbox" class="bd0" id="selecctall">
						</th>
					</tr>
				</thead>
				<tbody>
					{assign var=menuId value=-1}
					{foreach from=$listRecords item=item key=key}
							{math equation="1+x+((y-1)*z)" assign=idx x=$key y=$moduleSession.paging.pgNo z=$moduleSession.paging.noRowsDisplayed}
							{if $item.menuadmin_id!=$menuId}
							<tr class="warning">
								<td colspan="8" class="bg1 bold"><span class="glyphicon glyphicon-folder-open"></span> &nbsp; {$item.menuadmin_name|upper} {if $item.menuadmin_active==1}(active){else}(blocked){/if}</td>
							</tr>
							{/if}
							{assign var=menuId value=$item.menuadmin_id}
							<tr align="center"> 
								<td>{$idx}.</td>
								<td align="left">{$item.smenuadmin_name}</td>
								<td align="left">{$item.smenuadmin_link}</td>
								<td>{$item.smenuadmin_priority}</td>
								<td>{if $item.smenuadmin_master==1}set{else}unset{/if}</td>
								<td>
									<a href="index.php?obj={$smarty.get.obj}&action=switch&fieldName={$flagName}&{$idName}={$item.$idName}" title="{#txtTitleSwitch#}">
										{if 1==$item.$flagName}
											<button type="button" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span></button>
										{else}
											<button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-lock"></span></button>
										{/if}
									</a>	
								</td>
								<td align="center">
									<a href="index.php?obj={$smarty.get.obj}&action=page&{$idName}={$item.$idName}&act=upd">
										<button type="button" class="btn btn-default"><span class="glyphicon glyphicon-edit"></span></button>
									</a>
								</td>
								<td align="right"><input type="checkbox" name="ids[]" value="{$item.$idName}" onClick="verifyRowChecked(document.form_list, 'ids')" class="bd0 jsx_checkbox" {if !$item.del_op}disabled{/if}></td>
							</tr>
					{/foreach}
				</tbody>
			</form>
		</table>
		<div class="form-group col-md-12 panel-info">
			{include file="tpl_utile/paging_admin.tpl" pagingVariables=$moduleSession.paging}
		</div>
	{else}
		<div class="form-group col-md-12 panel-info">
			{#pgInvalidNoPage#}
		</div>
	{/if}
{else}
	<div class="form-group col-md-12 panel-info">
		{if $moduleSession.search.act=='search'}{#txtSResultNull#}{else}{#txtResultNull#}{/if}
	</div>		
{/if}

{include file="admin/inc/bottom.tpl"}