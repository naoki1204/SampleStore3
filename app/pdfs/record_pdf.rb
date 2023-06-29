class RecordPdf < Prawn::Document

  # recordにモデルなどのデータを渡します
  def initialize(record)

    # superで初期設定を指定します(ページサイズ、マージン等)
    super(
      page_size: "A4",
      top_margin: 40,
      bottom_margin: 30,
      left_margin: 20,
      right_margin: 20,
    )

    @record = record # インスタンスを受け取り。コンポーネント作成時などにレコード内のデータを使える

    font "app/assets/fonts/ipaexm.ttf"

    header
    line_item_rows
  end

  # コンポーネント作成
  def header
    text '商品一覧', size: 50
    move_down 20
  end

  # def line_items
  #   move_down 20
  #   table line_item_rows
  # end

  def line_item_rows

    data = []
    data.push ["商品番号", "商品名", "単価"]
    @record.map do |item|

      data.push [item.number,item.name,item.unit_price]
      # [item.number, item.name, item.unit_price]
    end
    table data
  end
end
