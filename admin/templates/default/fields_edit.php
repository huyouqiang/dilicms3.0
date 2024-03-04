<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');?>
<div class="headbar">
	<div class="alert alert-primary"><?=$bread?></div>
</div>
<style>
ul {
    padding-left:0px;
}
</style>
<div class="content_box">
	<div class="content form_content">
        <?php echo form_open($this->uri->rsegment(1).'/edit_field/'.$field->id); ?>
			<table class="table" >
				<col width="150px" />
				<col />
				<tr>
					<th> 字段标识：</th>
					<td><?php $this->form->show('name','input','',$field->name); ?><label>*字段名称，3-20位字母。</label><?php echo form_error('name'); ?></td>
				</tr>
                <tr>
					<th> 字段名称：</th>
					<td><?php $this->form->show('description','input','',$field->description); ?><label>*有意义的名称,最多40个字符。</label><?php echo form_error('description'); ?></td>
				</tr>
                <tr>
					<th> 字段类型：</th>
					<td><?php $this->form->show('type','select',array_merge(setting('fieldtypes'),setting('extra_fieldtypes')),$field->type); ?><label>*选择一个适当的字段类型。</label><?php echo form_error('type'); ?></td>
				</tr>
                <tr>
					<th> 字段长度：</th>
					<td><?php $this->form->show('length','input','',$field->length); ?><label>设置一个适当的字段长度,可以不填写，参看默认值.</label><?php echo form_error('length'); ?></td>
				</tr>
                
                <tr>
					<th> 数据源：</th>
					<td><?php $this->form->show('values','input','',$field->values); ?><label>可以为某些字段类型提供数据源或者默认值，使用方式<a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#myModal">点击此处</a>。</label><?php echo form_error('values'); ?></td>
				</tr>
                <tr>
					<th> 显示尺寸：</th>
					<td>
						宽：<?php $this->form->show('width','input','',$field->width); ?><label>*表单控件的显示的宽度,单位为px</label><?php echo form_error('width'); ?><br  />
                    	高：<?php $this->form->show('height','input','',$field->height); ?><label>*表单控件的显示的高度,单位为px</label><?php echo form_error('height'); ?>
                    </td>
				</tr>
                <tr>
					<th> 验证规则：</th>
					<td><?php $this->form->show('rules','checkbox',setting('validation'),$field->rules); ?><label></label><?php echo form_error('rules'); ?></td>
				</tr>
                <tr>
					<th> 规则说明：</th>
					<td><?php $this->form->show('ruledescription','input','',$field->ruledescription); ?><label></label><?php echo form_error('ruledescription'); ?></td>
				</tr>
                <tr>
					<th> 管理选项：</th>
					<td>
                    	<?php $this->form->show('searchable','checkbox','是否加入搜索',$field->searchable);?>
                		<?php $this->form->show('listable','checkbox','是否列表显示',$field->listable); ?>
                        <?php $this->form->show('editable','checkbox','是否允许编辑',$field->editable); ?>
                    </td>
				</tr>
                <tr>
					<th> 显示顺序：</th>
					<td><?php $this->form->show('order','input','',$field->order); ?><label></label><?php echo form_error('order'); ?></td>
				</tr>
				<tr>
					<th></th>
					<td>
						<button class="btn btn-sm btn-primary" type='submit'><span>修改字段</span></button>
					</td>
				</tr>
			</table>
		<?php echo form_close(); ?>
	</div>
</div>

<!-- 模态框 -->
<div class="modal" id="myModal" style="margin-top: 50px;">
  <div class="modal-dialog">
    <div class="modal-content">
 
      <!-- 模态框头部 -->
      <div class="modal-header">
        <h6 class="modal-title">数据源</h6>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
 
      <!-- 模态框内容 -->
      <div class="modal-body">
        
	  	<table class="table table-sm table-bordered">
		<tbody><tr><td> 字段类型</td><td> 数据源说明</td></tr><tr><td> 整形</td><td>不用设置 </td></tr><tr><td> 浮点型</td><td>不用设置 </td></tr><tr><td> 单行文本框</td><td>不用设置 </td></tr><tr><td>文本区域<br>
		<br>
		</td><td>不用设置</td></tr><tr><td>下拉菜单</font></td><td><font>设置如:“0=分类1|1=分类2”字符串<br>
		<br>
		</font></td></tr><tr><td><font>下拉菜单（模型数据）</font></td><td><font>设置格式如下"分类模型名称|显示的字段",如:class|name，建议1层分类模型使用<br>
		<br>
		</font></td></tr><tr><td><font>联动下拉菜单</font></td><td><font>设置格式如下"分类模型名称|显示的字段|分类的层级|最大选择量",如class|name|2|1,将生成1个2级联动菜单</font></td></tr><tr><td>单选按钮</td><td>同下拉菜单</td></tr><tr><td>复选框</td><td>同下拉菜单</td></tr><tr><td>编辑器</td><td>不用设置</td></tr><tr><td>日期时间</td><td>不用设置</td></tr><tr><td>颜色选择器</td><td>不用设置</td></tr></tbody>
		</table>

      </div>
 
      <!-- 模态框底部 -->
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-primary" data-bs-dismiss="modal">关闭</button>
      </div>
 
    </div>
  </div>
</div>