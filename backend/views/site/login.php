<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

$this->title = 'Login';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="login-box">
  <div class="login-logo">
    <a href="../../index2.html"><b>Admin</b>LTE</a>
  </div><!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Sign in to start your session</p>
    <?php $form = ActiveForm::begin(['id' => 'login-form']); ?>  
        <?= $form->field($model, 'username', [
            'options' => [
              'tag'         => 'div', 
              'class'       => 'form-group field-loginform-username has-feedback required'
            ],
            'template' => '{input}<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                          {error}{hint}'
        ])->textInput(['placeholder' => 'Email']);
        ?>

        <?= $form->field($model, 'password', [
            'options' => [
              'tag'         => 'div', 
              'class'       => 'form-group field-loginform-username has-feedback required'
            ],
            'template' => '{input}<span class="glyphicon glyphicon-lock form-control-feedback"></span>'
        ])->passwordInput(['placeholder' => 'Password']); 
        ?>
    
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox" name="LoginForm[rememberMe]"> RememberMe
            </label>
          </div>
        </div><!-- /.col -->
        <div class="col-xs-4">
              <?= Html::submitButton('Sign In', ['class' => 'btn btn-primary btn-block btn-flat', 'name' => 'login-button']) ?>
        </div><!-- /.col -->
      </div>
    <?php ActiveForm::end(); ?>

    <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using Facebook</a>
      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using Google+</a>
    </div><!-- /.social-auth-links -->

    <a href="#">I forgot my password</a><br>
    <a href="register.html" class="text-center">Register a new membership</a>

  </div><!-- /.login-box-body -->
</div><!-- /.login-box -->
