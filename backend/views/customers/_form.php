<?php

use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\widgets\ActiveForm;
use backend\models\Locations;
use kartik\select2\Select2;

/* @var $this yii\web\View */
/* @var $model backend\models\Customers */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="customers-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'customer_name')->textInput(['maxlength' => true]) ?>

    <?php
    // Normal select with ActiveForm & model
    echo $form->field($model, 'zip_code')->widget(Select2::classname(), [
        'data' => ArrayHelper::map(Locations::find()->all(), 'zip_code', 'zip_code'),
        'language' => 'en',
        'options' => ['placeholder' => 'Selecione a Zip Code...', 'id' => 'zipCode'],
        'pluginOptions' => [
            'allowClear' => true
        ],
    ]);
    ?>

    <?= $form->field($model, 'city')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'province')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<?php 
$script = <<< JS
//here you right all your javascript stuff
$('#zipCode').change(function(){
	var zipCode = $(this).val();
	$.get('index.php?r=locations/get-city-province', { zipCode : zipCode }, function(data){
		var data = $.parseJSON(data);
		$('#customers-city').val(data.city);
		$('#customers-province').val(data.province);
	});
});
JS;
$this->registerJS($script);
?>