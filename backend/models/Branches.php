<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "branches".
 *
 * @property integer $branch_id
 * @property integer $companies_company_id
 * @property string $branch_name
 * @property string $branch_address
 * @property string $branch_created_date
 * @property string $branch_status
 *
 * @property Companies $companiesCompany
 * @property Departaments[] $departaments
 */
class Branches extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'branches';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['companies_company_id'], 'integer'],
            [['branch_created_date'], 'safe'],
            [['branch_status'], 'string'],
            [['branch_name', 'branch_address'], 'string', 'max' => 100]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'branch_id' => 'Branch ID',
            'companies_company_id' => 'Companies Company ID',
            'branch_name' => 'Branch Name',
            'branch_address' => 'Branch Address',
            'branch_created_date' => 'Branch Created Date',
            'branch_status' => 'Branch Status',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCompaniesCompany()
    {
        return $this->hasOne(Companies::className(), ['company_id' => 'companies_company_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDepartaments()
    {
        return $this->hasMany(Departaments::className(), ['branches_branch_id' => 'branch_id']);
    }
}
