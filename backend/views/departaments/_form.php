<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Departaments */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="departaments-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'branches_branch_id')->textInput() ?>

    <?= $form->field($model, 'departament_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'companies_company_id')->textInput() ?>

    <?= $form->field($model, 'departament_status')->dropDownList([ 'active' => 'Active', 'inactive' => 'Inactive', ], ['prompt' => '']) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
