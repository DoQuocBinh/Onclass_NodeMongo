const express = require('express');
var router = express.Router();
var MongoClient = require('mongodb').MongoClient;

var url = 'mongodb://localhost:27017';

router.get('/',async (req,res)=>{
    let client= await MongoClient.connect(url);
    let dbo = client.db("NoSQLBoosterSamples");
    let results = await dbo.collection("SanPham").find({}).toArray();
    res.render('allSanPham',{sanPham:results});
})

//sanpham/insert->browser
router.get('/insert',(req,res)=>{
    res.render('insertProduct');
})
router.post('/insert',async (req,res)=>{
    let client= await MongoClient.connect(url);
    let dbo = client.db("NoSQLBoosterSamples");
    let name = req.body.tenSP;
    let gia = req.body.giaSP;
    let newSP = {TenSP : name, Gia:gia};
    await dbo.collection("SanPham").insertOne(newSP);
   
    let results = await dbo.collection("SanPham").find({}).toArray();
    res.render('allSanPham',{sanPham:results});
})

//sanpham/search->browser
router.get('/search',(req,res)=>{
    res.render('searchSanPham');
})

//sanpham/search ->post
router.post('/search',async (req,res)=>{
    let searchSP = req.body.tenSP;
    let client= await MongoClient.connect(url);
    let dbo = client.db("NoSQLBoosterSamples");
    let results = await dbo.collection("SanPham").find({"TenSP":searchSP}).toArray();
    res.render('allSanPham',{sanPham:results});
})

module.exports = router;