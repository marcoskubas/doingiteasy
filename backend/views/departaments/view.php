<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Departaments */

$this->title = $model->departament_id;
$this->params['breadcrumbs'][] = ['label' => 'Departaments', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="departaments-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->departament_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->departament_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'departament_id',
            'branches_branch_id',
            'departament_name',
            'companies_company_id',
            'departament_created_date',
            'departament_status',
        ],
    ]) ?>

</div>
