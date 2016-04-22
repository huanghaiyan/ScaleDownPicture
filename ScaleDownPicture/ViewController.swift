//
//  ViewController.swift
//  ScaleDownPicture
//
//  Created by 黄海燕 on 16/4/22.
//  Copyright © 2016年 huanghy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //从项目资源文件中读取一张图片
        let image = UIImage(named: "1.jpg")
        //调用缩放图片的方法，将图片缩小至指定尺寸
        let scaledImage = self.scaleImage(image!, newSize: CGSizeMake(180,180))
        //创建一个图像视图，并加载尺寸缩小后的图片
        let imageView = UIImageView(image: scaledImage)
        //设置图像视图的中心点坐标（160，160）
        imageView.center = CGPointMake(160, 160)
        self.view.addSubview(imageView)
        
    }
    
    //首先创建一个方法，传递一个图像参数，和一个缩放比例参数，实现将图像，缩放至指定比例的功能
    func scaleImage(image:UIImage,newSize:CGSize) -> UIImage {
        //获得源图像的尺寸属性
        let imageSize = image.size
        //获得源图像的宽度数值
        let width = imageSize.width
        //获得源图像的高度数值
        let height = imageSize.height
        //计算图像新尺寸与旧尺寸的宽高比例
        let widthFactor = newSize.width/width
        let heightFactor = newSize.height/height
        //获取最小的那个比例
        let scaleFactor = (widthFactor<heightFactor) ? widthFactor : heightFactor
        //计算图像新的宽度和高度，并将新的宽度和高度，构建成标准CGSize对象
        let scaleWidth = width * scaleFactor
        let scaleHeight = height * heightFactor
        let targetSize = CGSizeMake(scaleWidth, scaleHeight)
        
        //创建绘图上文环境
        UIGraphicsBeginImageContext(targetSize)
        //将图像对象，画入之前计算的新尺寸里，原点为（0，0）
        image.drawInRect(CGRectMake(0, 0, scaleWidth, scaleHeight))
        //获取上下文里的内容，将内容写入到新的图像对象
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        //在方法的结尾，返回生成的新的图像对象
        return newImage
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

