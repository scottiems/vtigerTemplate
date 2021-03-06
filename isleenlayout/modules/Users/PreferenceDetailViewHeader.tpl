{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
* ("License"); You may not use this file except in compliance with the License
* The Original Code is:  vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
*
********************************************************************************/
-->*}
{strip}
    {assign var="MODULE_NAME" value=$MODULE_MODEL->get('name')}
    <input id="recordId" type="hidden" value="{$RECORD->getId()}" />
    <div class="detailViewContainer">
        <header class="panel-heading" style="height: 80px;">
            <div class="detailViewTitle FloatWidth" id="prefPageHeader">
                <div class="row-fluid FloatWidth">
                    <div class="col-md-8">
                        <span class="row-fluid marginLeftZero FloatWidth">
    						<span class="logo col-md-1 paddingLeftRight">
    							{foreach key=ITER item=IMAGE_INFO from=$RECORD->getImageDetails()}
    								{if !empty($IMAGE_INFO.path) && !empty($IMAGE_INFO.orgname)}
    									<img src="{$IMAGE_INFO.path}_{$IMAGE_INFO.orgname}" alt="{$IMAGE_INFO.orgname}" title="{$IMAGE_INFO.orgname}" data-image-id="{$IMAGE_INFO.id}" style="width:100%;height:50px">
    								{/if}
    							{/foreach}
    						</span>
    						<span class="col-md-11">
    							<span id="myPrefHeading" class="row-fluid">
    								<h3 style="margin-top:0;">{vtranslate('LBL_MY_PREFERENCES', $MODULE_NAME)} </h3>
    							</span>
    							<span class="row-fluid">
    								{vtranslate('LBL_USERDETAIL_INFO', $MODULE_NAME)}&nbsp;&nbsp;"<b>{$RECORD->getName()}</b>"
    							</span>
    						</span>
    					</span>
                    </div>
                    <div class="col-md-4">
                        <div class="row-fluid pull-right detailViewButtoncontainer">
    						<div class="btn-toolbar pull-right">
                                {foreach item=DETAIL_VIEW_BASIC_LINK from=$DETAILVIEW_LINKS['DETAILVIEWPREFERENCE']}
                                    <div class="btn-group">
                                        <button class="btn"
                                                {if $DETAIL_VIEW_BASIC_LINK->isPageLoadLink()}
                                                    onclick="window.location.href='{$DETAIL_VIEW_BASIC_LINK->getUrl()}'"
                                                {else}
                                                    onclick={$DETAIL_VIEW_BASIC_LINK->getUrl()}
                                                {/if}>
                                            <strong>{vtranslate($DETAIL_VIEW_BASIC_LINK->getLabel(), $MODULE_NAME)}</strong>
                                        </button>
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div class="panel-body">
        <div class="detailViewInfo row-fluid">
            <div class="details col-md-12">
                <form id="detailView" data-name-fields='{ZEND_JSON::encode($MODULE_MODEL->getNameFields())}'>
                    <div class="contents">
                    {/strip}