class RenamePregectureIdColumnToPrefectureId < ActiveRecord::Migration[6.0]
  def change
    rename_column :deliveries, :pregecture_id, :prefecture_id
  end
end
