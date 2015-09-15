<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "posts".
 *
 * @property string $post_id
 * @property string $post_title
 * @property string $post_description
 * @property string $author_id
 *
 * @property Users $author
 */
class Posts extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'posts';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['post_description'], 'string'],
            [['post_title', 'post_description', 'author_id'], 'required'],
            [['author_id'], 'integer'],
            [['post_title'], 'string', 'max' => 100]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'post_id'          => 'Post ID',
            'post_title'       => 'Post Title',
            'post_description' => 'Post Description',
            'author_id'        => 'Author ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAuthor()
    {
        return $this->hasOne(Users::className(), ['user_id' => 'author_id']);
    }
}
