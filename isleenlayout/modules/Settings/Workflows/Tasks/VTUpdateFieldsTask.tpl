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
	<div class="row-fluid">
		<div class="col-md-12 m-bot15"><strong>{vtranslate('LBL_SET_FIELD_VALUES',$QUALIFIED_MODULE)}</strong></div>
	</div>
	<div class="col-md-3 m-bot15">
		<button type="button" class="btn" id="addFieldBtn">{vtranslate('LBL_ADD_FIELD',$QUALIFIED_MODULE)}</button>
	</div>
	<div class="row-fluid conditionsContainer" id="save_fieldvaluemapping">
		{assign var=FIELD_VALUE_MAPPING value=ZEND_JSON::decode($TASK_OBJECT->field_value_mapping)}
		<input type="hidden" id="fieldValueMapping" name="field_value_mapping" value='{Vtiger_Util_Helper::toSafeHTML($TASK_OBJECT->field_value_mapping)}' />
		{foreach from=$FIELD_VALUE_MAPPING item=FIELD_MAP}
			<div class="row-fluid conditionRow padding-bottom1per">
				<span class="col-md-4">
					<select name="fieldname" class="chzn-select form-control" data-placeholder="{vtranslate('LBL_SELECT_FIELD',$QUALIFIED_MODULE)}" style="width:100%">
						<option></option>
						{foreach from=$MODULE_MODEL->getFields() item=FIELD_MODEL}
                            {if !$FIELD_MODEL->isEditable() or $FIELD_MODEL->getFieldDataType() eq 'reference'}
                                {continue}
                            {/if}
							{assign var=FIELD_INFO value=$FIELD_MODEL->getFieldInfo()}
							{assign var=MODULE_MODEL value=$FIELD_MODEL->getModule()}
							<option value="{$FIELD_MODEL->get('name')}" {if $FIELD_MAP['fieldname'] eq $FIELD_MODEL->get('name')}selected=""{/if}data-fieldtype="{$FIELD_MODEL->getFieldType()}" data-field-name="{$FIELD_MODEL->get('name')}" data-fieldinfo='{ZEND_JSON::encode($FIELD_INFO)}' >
								{if $SOURCE_MODULE neq $MODULE_MODEL->get('name')}
									({vtranslate($MODULE_MODEL->get('name'), $MODULE_MODEL->get('name'))})  {vtranslate($FIELD_MODEL->get('label'), $MODULE_MODEL->get('name'))}
								{else}
									{vtranslate($FIELD_MODEL->get('label'), $SOURCE_MODULE)}
								{/if}
							</option>
						{/foreach}
					</select>
				</span>
				<span class="fieldUiHolder col-md-4 marginLeftZero">
					<input type="text" class="getPopupUi form-control" readonly="" name="fieldValue" value="{$FIELD_MAP['value']}" />
					<input type="hidden" name="valuetype" value="{$FIELD_MAP['valuetype']}" />
				</span>
				<span class="cursorPointer span">
					<i class="alignMiddle deleteCondition fa fa-trash-o"></i>
				</span>
			</div>
		{/foreach}
		{include file="FieldExpressions.tpl"|@vtemplate_path:$QUALIFIED_MODULE}
		</div><br>
		<div class="row-fluid basicAddFieldContainer hide padding-bottom1per">
			<span class="col-md-4">
				<select name="fieldname" class=" form-control" data-placeholder="{vtranslate('LBL_SELECT_FIELD',$QUALIFIED_MODULE)}" style="width:100%">
					<option></option>
					{foreach from=$MODULE_MODEL->getFields() item=FIELD_MODEL}
                        {if !$FIELD_MODEL->isEditable() or $FIELD_MODEL->getFieldDataType() eq 'reference'}
                            {continue}
                        {/if}
						{assign var=FIELD_INFO value=$FIELD_MODEL->getFieldInfo()}
						{assign var=MODULE_MODEL value=$FIELD_MODEL->getModule()}
						<option value="{$FIELD_MODEL->get('name')}" data-fieldtype="{$FIELD_MODEL->getFieldType()}" data-field-name="{$FIELD_MODEL->get('name')}" data-fieldinfo='{ZEND_JSON::encode($FIELD_INFO)}' >
							{if $SOURCE_MODULE neq $MODULE_MODEL->get('name')}
								({vtranslate($MODULE_MODEL->get('name'), $MODULE_MODEL->get('name'))})  {vtranslate($FIELD_MODEL->get('label'), $MODULE_MODEL->get('name'))}
							{else}
								{vtranslate($FIELD_MODEL->get('label'), $SOURCE_MODULE)}
							{/if}
						</option>
					{/foreach}
				</select>
			</span>
			<span class="fieldUiHolder col-md-4 marginLeftZero">
				<input type="text" class="form-control" readonly="" name="fieldValue" value="" />
				<input type="hidden" name="valuetype" value="rawtext" />
			</span>
			<span class="cursorPointer span">
				<i class="fa fa-trash-o alignMiddle deleteCondition"></i>
			</span>
		</div>
		{/strip}