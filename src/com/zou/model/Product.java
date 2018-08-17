package com.zou.model;

public class Product {
	private int id;				//商品ID
	private String productnum;	//商品编号
	private String productname;	//商品名称
	private String catrgoryno;	//商品分类编号
	private String category;	//商品分类名称
	private String imagepath;	//商品图片名称
	private String isnewproduct;//是否新商品1-true,0-false
	private String price1;		//价格
	private String price2;		//会员价格
	private String realstock;	//库存量
	private	String stock;		//剩余量
	private String cas;			//药品摘要
	private String mdlint;		//mdl编
	private String formula;		//化学方程式
	private String weight;		//重量
	private String state;		//软删除标志
	private String note;		//备注
	private int pageNow;
	
	public int getId(){
		return this.id;
	}

	public void serId(int id){
		this.id = id;
	}
	
	public String getProductnum(){
		return this.productnum;
	}
	
	public void setProductnum(String productnum){
		this.productnum = productnum;
	}
	
	public String getProductname(){
		return this.productname;
	}
	
	public void setProductname(String productname){
		this.productname = productname;
	}
	
	public String getCatrgoryno(){
		return this.catrgoryno;
	}
	
	public void setCatrgoryno(String catrgoryno){
		this.catrgoryno = catrgoryno;
	}
	
	public String getCategory(){
		return this.category;
	}
	
	public void setCategory(String category){
		this.category = category;
	}
	 
	public String getImagepath(){
		return this.imagepath;
	}
	
	public void setImagepath(String imagepath){
		this.imagepath = imagepath;
	}
	
	public String getIsnewproduct(){
		return this.isnewproduct;
	}
	
	public void setIsnewproduct(String isnewproduct){
		this.isnewproduct = isnewproduct;
	}
	
	public String getPrice1(){
		return this.price1;
	}
	
	public void setPrice1(String price1){
		this.price1 = price1;
	}
	
	public String getPrice2(){
		return this.price2;
	}
	
	public void setPrice2(String price2){
		this.price2 = price2;
	}
	
	public String getRealstock(){
		return this.realstock;
	}
	
	public void setRealstock(String realstock){
		this.realstock = realstock;
	}

	public String getStock(){
		return this.stock;
	}
	
	public void setStock(String stock){
		this.stock = stock;
	}
	
	public String getCas(){
		return this.cas;
	}
	
	public void setCas(String cas){
		this.cas = cas;
	}
	
	public String getMdlint(){
		return this.mdlint;
	}
	
	public void setMdlint(String mdlint){
		this.mdlint = mdlint;
	}
	
	public String getFormula(){
		return this.formula;
	}
	
	public void setFormula(String formula){
		this.formula = formula;
	}
	
	public String getWeight(){
		return this.weight;
	}
	
	public void setWeight(String weight){
		this.weight = weight;
	}
	
	public String getState(){
		return this.state;
	}
	
	public void setState(String state){
		this.state = state;
	}
	
	public String getNote(){
		return this.note;
	}
	
	public void setNote(String note){
		this.note = note;
	}

	public int getPageNow() {
		return this.pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}
}
