<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\DepartamentsSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Departaments';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="departaments-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Departaments', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            // 'departament_id',
            'branchesBranch.branch_name',
            'departament_name',
            'companiesCompany.company_name',
            'departament_created_date',
            // 'departament_status',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
