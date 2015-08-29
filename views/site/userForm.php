<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

if(Yii::$app->session->hasFlash('success')):
?>
	<div class="alert alert-success" role="alert">
      <strong>Success!</strong> <?php echo Yii::$app->session->getFlash('success')?>
    </div>
<?php
endif;

$form = ActiveForm::begin();

//Name
echo $form->field($model, 'name');

//E-mail
echo $form->field($model, 'email');

echo Html::submitButton('Enviar', ['class' => 'btn btn-success']);