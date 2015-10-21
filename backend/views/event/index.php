<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\bootstrap\Modal;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\EventSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Events';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="event-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <?php 
    Modal::begin([
            'header' => '<h4>Events</h4>',
            'id'     => 'modal',
            'size'   => 'modal-lg'
        ]);

    echo "<div id='modalContent'></div>";

    Modal::end();
    ?>

  <?php
  echo \yii2fullcalendar\yii2fullcalendar::widget(array(
      'events'=> $events,
  ));
  ?>

    <? /*GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'title',
            'description:ntext',
            'created_date',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]);*/ ?>

</div>
