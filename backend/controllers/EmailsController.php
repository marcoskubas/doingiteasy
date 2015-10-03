<?php

namespace backend\controllers;

use Yii;
use backend\models\Companies;
use backend\models\Emails;
use backend\models\EmailsSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\UploadedFile;
use yii\web\ForbiddenHttpException;

/**
 * EmailsController implements the CRUD actions for Emails model.
 */
class EmailsController extends Controller
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all Emails models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new EmailsSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Emails model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Emails model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Emails();

        if ($model->load(Yii::$app->request->post())) {

            //send the email
            //get the company email and the company name
            // $company = Companies::findOne(Yii::$app->user->identity->companies_company_id);

            //upload the attachment
            $model->attachment = UploadedFile::getInstance($model, 'attachment');

            if($model->attachment){    
                $imageName   = time();
                $imagePath   = 'attachments/' . $imageName . '.' . $model->attachment->extension;
                $model->attachment->saveAs($imagePath);
                $model->attachment = $imagePath;
            }

            if($model->attachment){
                $value = Yii::$app->mailer->compose()
                ->setFrom(['marcosarobed@gmail.com' => 'MarcosKubas'])
                ->setTo($model->receiver_email)
                ->setSubject($model->subject)
                ->setHtmlBody($model->content)
                ->attach($model->attachment)
                ->send();
            }else{
                $value = Yii::$app->mailer->compose()
                // ->setFrom([$company->company_email => $company->company_name])
                ->setFrom(['marcosarobed@gmail.com' => 'MarcosKubas'])
                ->setTo($model->receiver_email)
                ->setSubject($model->subject)
                ->setHtmlBody($model->content)
                ->send();
            }

            $model->save();
            // print_r($model->getErrors());
            return $this->redirect(['view', 'id' => $model->email_id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Emails model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->email_id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Emails model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Emails model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Emails the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Emails::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
