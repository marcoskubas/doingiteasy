<?php

use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\widgets\ActiveForm;
use backend\models\Companies;
use kartik\select2\Select2;

/* @var $this yii\web\View */
/* @var $model backend\models\Branches */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="branches-form">

    <?php $form = ActiveForm::begin(['id' => $model->formName()]); ?>

    <?php
    /*echo $form->field($model, 'companies_company_id')->dropDownList(
    	ArrayHelper::map(Companies::find()->all(), 'company_id', 'company_name'),
    	['prompt' => 'Select Company']
    )*/

    // Normal select with ActiveForm & model
    echo $form->field($model, 'companies_company_id')->widget(Select2::classname(), [
        'data' => ArrayHelper::map(Companies::find()->all(), 'company_id', 'company_name'),
        'language' => 'en',
        'options' => ['placeholder' => 'Selecione ...'],
        'pluginOptions' => [
            'allowClear' => true
        ],
    ]);
    ?>

    <?= $form->field($model, 'branch_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'branch_address')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'branch_status')->dropDownList([ 'active' => 'Active', 'inactive' => 'Inactive', ], ['prompt' => '']) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<?php 
$script = <<< JS

$('form#{$model->formName()}').on('beforeSubmit', function(e){
    var \$form = $(this);
    $.post(
        \$form.attr("action"), //serialize Yii2 form 
        \$form.serialize()
    )
    .done(function(result){
        result = JSON.parse(result);
        if(result.status == 'Success'){
            $(\$form).trigger("reset");
            $(document).find('#modal').modal('hide');
            $.pjax.reload({container:'#branchesGrid'});
        }else{
            $(\$form).trigger("reset");
            $("#message").html(result.message);
        }
    })
    .fail(function(){
        console.log("server error");
    });

    return false;
});

JS;
$this->registerJS($script);
?>
