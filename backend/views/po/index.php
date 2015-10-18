<?php

use yii\helpers\Html;
use kartik\grid\GridView;
use backend\models\PoItemSearch;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\PoSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Pos';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="po-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Po', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            [
                'class' => 'kartik\grid\ExpandRowColumn',
                'value' => function($model, $key, $index, $column){
                    return GridView::ROW_COLLAPSED;
                },
                'detail' => function($model, $key, $index, $column){
                    $searchModel        = new PoItemSearch();
                    $searchModel->po_id = $model->id;
                    $dataProvider       = $searchModel->search(Yii::$app->request->queryParams);

                    return Yii::$app->controller->renderPartial('_poitems', [
                        'searchModel'  => $searchModel,
                        'dataProvider' => $dataProvider
                    ]);
                },
            ],
            'po_no',
            'description:ntext',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
