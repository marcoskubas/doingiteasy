<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "departaments".
 *
 * @property integer $departament_id
 * @property integer $branches_branch_id
 * @property string $departament_name
 * @property integer $companies_company_id
 * @property string $departament_created_date
 * @property string $departament_status
 *
 * @property Branches $branchesBranch
 * @property Companies $companiesCompany
 */
class Departaments extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'departaments';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['branches_branch_id', 'companies_company_id'], 'required'],
            [['branches_branch_id', 'companies_company_id'], 'integer'],
            [['departament_created_date'], 'safe'],
            [['departament_status'], 'string'],
            [['departament_name'], 'string', 'max' => 100]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'departament_id' => 'Departament ID',
            'branches_branch_id' => 'Branches Branch ID',
            'departament_name' => 'Departament Name',
            'companies_company_id' => 'Companies Company ID',
            'departament_created_date' => 'Departament Created Date',
            'departament_status' => 'Departament Status',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBranchesBranch()
    {
        return $this->hasOne(Branches::className(), ['branch_id' => 'branches_branch_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCompaniesCompany()
    {
        return $this->hasOne(Companies::className(), ['company_id' => 'companies_company_id']);
    }
}
