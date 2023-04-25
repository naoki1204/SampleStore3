import React, { Component } from 'react'
import PropTypes from "prop-types"
class Product extends React.Component {
  //コンストラクタ。
  //このコンポーネントのstateには絞り込み前のタスク一覧と、絞り込み後のタスク一覧をそれぞれ用意する
  constructor(props) {
    super(props)
    this.state = { initialProducts: this.props.products, products: [] }
  }

  //ブラウザロード時の処理。
  //最初は商品全部を表示しておく
  componentDidMount() {
    this.setState({ products: this.state.initialProducts })
  }

  //検索のメソッドをここで用意しておく
  searchByName(name) {
    const result = this.state.initialProducts.filter((product) => {
      return product.name.toLowerCase().search(name.toLowerCase()) !== -1;
    })
    this.setState({ products: result })
  }

  /*
    ページ全体のrenderメソッド。
    大事なのは、FilterFormのprops（search）に、上記で定義したsearchByNameを定義しておくこと。
    これにより、ProductコンポーネントのstateにあるProductsを変更することができる。
    そして、変更したProductsを、ProductListコンポーネントにpropsで渡してあげることで、
    絞り込み後のタスク一覧を表示することができる。
  */
  render() {
    return (
      <div>
        <h1>商品一覧</h1>
        <FilterForm search={(name) => this.searchByName(name)} />
        <ProductList products={this.state.products} />
      </div>
    )
  }
}

//検索フォームのコンポーネント
class FilterForm extends Component {

  //コンストラクタ。ここでは、検索値nameをstateとして持っておく
  constructor(props) {
    super(props)
    this.state = { name: '' }
  }

  //検索のテキストボックスの中身が変更された時の処理。
  //stateに検索値を挿入しておく
  onChangeName(event) {
    this.setState({ name: event.target.value })
  }

  //検索ボタンをクリックされた時の処理。
  //上記で書いた通り、 Productのコンポーネントで渡されたsearchメソッドを実行することにより、
  //Productコンポーネントのstateに、絞り込み後のタスク一覧を表示することができる
  onClickSearch() {
    this.props.search(this.state.name)
  }

  //検索フォームのrenderメソッド。
  render() {
    return (
      <div className="entry">
        <fieldset>
          <legend>検索</legend>
          <div>名前で検索: <input type="text" value={this.state.name} name="name" onChange={(e) => this.onChangeName(e)} placeholder="例：商品A" /> </div>
          <div> <input type="submit" value="検索" onClick={(e) => this.onClickSearch(e)} /> </div>
        </fieldset>
      </div>
    )
  }
}

//タスク一覧についてのコンポーネント。
//こちらは上2つのクラスコンポーネントとは違い、関数コンポーネントになっている。
//クラスコンポーネントとは違い、できることが限られているため、シンプルな表示だけしたいときに使う。
const ProductList = (props) => {
  //タスク一覧を表示する。
  //繰り返し処理にはmap関数を使用。
  return (
    <div>
      <table className="product">
        <thead data-type="ok">
          <tr><th>商品番号</th><th>商品名</th><th>単価</th><th>画像</th><th>備考</th><th>数量</th><th>種類</th></tr>
        </thead>
        <tbody>
          {props.products.map((product) =>
            <ProductItem product={product} key={product.id} />)}
        </tbody>
      </table>
    </div>
  )
}
//ProductListコンポーネントが受け取るpropsを定義。
//ここではタスク一覧を受け取ることができるように定義しておく。
ProductList.propTypes = {
  products: PropTypes.array.isRequired
}

//タスクの1つの行を表すコンポーネント。
//上と同様関数コンポーネント。
const ProductItem = (props) => {
  //受け取ったタスクのオブジェクトの値を、それぞれ行のセルに挿入。
  const { number, name, unit_price, image, description, quantity, category_id } = props.product
  return (
    <tr>
      <td>{number}</td>
      <td>{name}</td>
      <td>{unit_price}</td>
      <td>{image}</td>
      <td>{description}</td>
      <td>{quantity}</td>
      <td>{category_id}</td>
    </tr >
  )
}
//ProductItemコンポーネントが受け取るpropsを定義。
//ここではタスクオブジェクト。
ProductItem.propTypes = {
  product: PropTypes.object.isRequired
}

//react-railsではこの行がないとエラーになるっぽい。
//メインとなるクラス名（ここではProduct）、ここで書いているクラス名、ファイル名の3つの名前が一緒じゃないと、
//エラーが起こって実行できなかった。

export default Product
