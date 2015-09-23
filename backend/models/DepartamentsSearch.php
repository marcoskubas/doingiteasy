<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Departaments;

/**
 * DepartamentsSearch represents the model behind the search form about `backend\models\Departaments`.
 */
class DepartamentsSearch extends Departaments
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['departament_id', 'branches_branch_id', 'companies_company_id'], 'integer'],
            [['departament_name', 'departament_created_date', 'departament_status'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Departaments::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'departament_id' => $this->departament_id,
            'branches_branch_id' => $this->branches_branch_id,
            'companies_company_id' => $this->companies_company_id,
            'departament_created_date' => $this->departament_created_date,
        ]);

        $query->andFilterWhere(['like', 'departament_name', $this->departament_name])
            ->andFilterWhere(['like', 'departament_status', $this->departament_status]);

        return $dataProvider;
    }
}
