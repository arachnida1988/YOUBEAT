package com.you.beat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.you.shoppingcart.ShoppingcartDTO;
import com.you.shoppingcart.ShoppingcartService;

@Controller
@RequestMapping(value="/shoppingcart")
public class ShoppingcartController {
	
	@Autowired
	private ShoppingcartService scService;
	
	// 장바구니 등록
	@RequestMapping(value="/shoppingcartAdd", method=RequestMethod.POST)
	public String shoppingcartAdd(ShoppingcartDTO shoppingcartDTO, Model model) {
		return this.scService.shoppingcartAdd(shoppingcartDTO, model);
	}
	
	// 장바구니 페이지
	@RequestMapping(value="/cartList", method=RequestMethod.GET)
	public String cartList(ShoppingcartDTO shoppingcartDTO, Model model) {
		return this.scService.cartList(shoppingcartDTO, model);
	}
	
	// AJAX 요청 부분 - 장바구니의 앨범 리스트
	@RequestMapping(value="/cartAlbumList", method=RequestMethod.GET)
	public String cartAlbumList(ShoppingcartDTO shoppingcartDTO, Model model) {
		return null;
	}
	
	// AJAX 요청 부분 - 장바구니의 음악 리스트
	@RequestMapping(value="/cartMusicList", method=RequestMethod.GET)
	public String cartMusicList(ShoppingcartDTO shoppingcartDTO, Model model) {
		return null;
	}
	
	// AJAX 요청 부분 - 장바구니의 앨범, 음악의 총 가격 얻어오기
	@RequestMapping(value="/cartTotalPriceResult", method=RequestMethod.GET)
	public String cartTotalPriceResult(ShoppingcartDTO shoppingcartDTO, Model model) {
		return null;
	}
}
