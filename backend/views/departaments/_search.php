<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\DepartamentsSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="departaments-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'departament_id') ?>

    <?= $form->field($model, 'branches_branch_id') ?>

    <?= $form->field($model, 'departament_name') ?>

    <?= $form->field($model, 'companies_company_id') ?>

    <?= $form->field($model, 'departament_created_date') ?>

    <?php // echo $form->field($model, 'departament_status') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
