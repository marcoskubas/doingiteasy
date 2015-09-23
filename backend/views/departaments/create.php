<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Departaments */

$this->title = 'Create Departaments';
$this->params['breadcrumbs'][] = ['label' => 'Departaments', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="departaments-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
