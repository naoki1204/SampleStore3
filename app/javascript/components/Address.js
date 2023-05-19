import React, { Component } from "react"
import PropTypes from "prop-types"
class Address extends React.Component {
  //コンストラクタ。
  //このコンポーネントのstateには絞り込み前のタスク一覧と、絞り込み後のタスク一覧をそれぞれ用意する
  constructor(props) {
    super(props)
    this.state = { initialAddresses: this.props.addresses, addresses: [] }
  }

  //ブラウザロード時の処理。
  //最初は商品全部を表示しておく
  componentDidMount() {
    this.setState({ addresses: this.state.initialAddresses })
  }

  //検索のメソッドをここで用意しておく
  searchByName(address_name) {
    const result = this.state.initialAddresses.filter((address) => {
      return address.address_name.toLowerCase().search(address_name.toLowerCase()) !== -1;
    })
    this.setState({ addresses: result })
  }

  /*
    ページ全体のrenderメソッド。
    大事なのは、FilterFormのprops（search）に、上記で定義したsearchByNameを定義しておくこと。
    これにより、AddressコンポーネントのstateにあるAddressesを変更することができる。
    そして、変更したAddressesを、AddressListコンポーネントにpropsで渡してあげることで、
    絞り込み後のタスク一覧を表示することができる。
  */
  render() {
    return (
      <div>
        <h1>住所一覧</h1>
        <FilterForm search={(address_name) => this.searchByName(address_name)} />
        <AddressList addresses={this.state.addresses} />
      </div>
    )
  }
}

//検索フォームのコンポーネント
class FilterForm extends Component {

  //コンストラクタ。ここでは、検索値nameをstateとして持っておく
  constructor(props) {
    super(props)
    this.state = { address_name: '' }
  }

  //検索のテキストボックスの中身が変更された時の処理。
  //stateに検索値を挿入しておく
  onChangeName(event) {
    this.setState({ address_name: event.target.value })
  }

  //検索ボタンをクリックされた時の処理。
  //上記で書いた通り、 Addressのコンポーネントで渡されたsearchメソッドを実行することにより、
  //Addressコンポーネントのstateに、絞り込み後のタスク一覧を表示することができる
  onClickSearch() {
    this.props.search(this.state.address_name)
  }

  //検索フォームのrenderメソッド。
  render() {
    return (
      <div className="entry">
        <fieldset>
          <legend>検索</legend>
          <div>名前で検索: <input type="text" value={this.state.address_name} name="address_name" onChange={(e) => this.onChangeName(e)} placeholder="例：住所A" /> </div>
          <div> <input type="submit" value="検索" onClick={(e) => this.onClickSearch(e)} /> </div>
        </fieldset>
      </div>
    )
  }
}

//タスク一覧についてのコンポーネント。
//こちらは上2つのクラスコンポーネントとは違い、関数コンポーネントになっている。
//クラスコンポーネントとは違い、できることが限られているため、シンプルな表示だけしたいときに使う。
const AddressList = (props) => {
  //タスク一覧を表示する。
  //繰り返し処理にはmap関数を使用。
  return (
    <div>
      <table className="address">
        <thead data-type="ok">
          <tr><th>名前</th><th>住所</th></tr>
        </thead>
        <tbody>
          {props.addresses.map((address) =>
            <AddressItem address={address} key={address.id} />)}
        </tbody>
      </table>
    </div>
  )
}
//AddressListコンポーネントが受け取るpropsを定義。
//ここではタスク一覧を受け取ることができるように定義しておく。
AddressList.propTypes = {
  addresses: PropTypes.array.isRequired
}

//タスクの1つの行を表すコンポーネント。
//上と同様関数コンポーネント。
const AddressItem = (props) => {
  //受け取ったタスクのオブジェクトの値を、それぞれ行のセルに挿入。
  const { address_name, address } = props.address
  return (
    <tr>
      <td>{address_name}</td>
      <td>{address}</td>
    </tr >
  )
}
//AddressItemコンポーネントが受け取るpropsを定義。
//ここではタスクオブジェクト。
AddressItem.propTypes = {
  address: PropTypes.object.isRequired
}

//react-railsではこの行がないとエラーになるっぽい。
//メインとなるクラス名（ここではAddress）、ここで書いているクラス名、ファイル名の3つの名前が一緒じゃないと、
//エラーが起こって実行できなかった。
export default Address
