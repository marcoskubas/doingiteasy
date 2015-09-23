<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Departaments */

$this->title = 'Update Departaments: ' . ' ' . $model->departament_id;
$this->params['breadcrumbs'][] = ['label' => 'Departaments', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->departament_id, 'url' => ['view', 'id' => $model->departament_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="departaments-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
