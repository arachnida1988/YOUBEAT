package com.you.beat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	// 장바구니 목록에서 삭제
	@RequestMapping(value="/shoppingcartDelete", method=RequestMethod.POST)
	public String shoppingcartDelete(ShoppingcartDTO shoppingcartDTO, Model model,
			@RequestParam String strSnum) {
		return this.scService.shoppingcartDelete(shoppingcartDTO, model, strSnum);
	}
	
	// 장바구니 페이지
	@RequestMapping(value="/cartList", method=RequestMethod.GET)
	public String cartList(ShoppingcartDTO shoppingcartDTO, Model model) {
		return this.scService.cartList(shoppingcartDTO, model);
	}
	
	// AJAX 요청 부분 - 장바구니의 음악 리스트
	@RequestMapping(value="/cartMusicList", method = {RequestMethod.GET, RequestMethod.POST})
	public String cartMusicList(ShoppingcartDTO shoppingcartDTO, Model model) {
		return this.scService.cartMusicList(shoppingcartDTO, model);
	}
	
	// AJAX 요청 부분 - 장바구니의 앨범 리스트
	@RequestMapping(value="/cartAlbumList", method = {RequestMethod.GET, RequestMethod.POST})
	public String cartAlbumList(ShoppingcartDTO shoppingcartDTO, Model model) {
		return this.scService.cartAlbumList(shoppingcartDTO, model);
	}
	
	// AJAX 요청 부분 - 장바구니의 앨범, 음악의 총 가격 얻어오기
	@RequestMapping(value="/cartTotalPriceResult", method = {RequestMethod.GET, RequestMethod.POST})
	public String cartTotalPriceResult(ShoppingcartDTO shoppingcartDTO, Model model) {
		return this.scService.cartTotalPriceResult(shoppingcartDTO, model);
	}
	
	// JSON 처리
	@RequestMapping(value="/checkingCartInfo", method = RequestMethod.GET)
	public ResponseEntity<List<ShoppingcartDTO>> checkingCartInfo(ShoppingcartDTO shoppingcartDTO) {
		List<ShoppingcartDTO> checkingInfo = this.scService.checkingCartInfo(shoppingcartDTO);
		// 정상적인 처리로 보내겠다.
		return new ResponseEntity<List<ShoppingcartDTO>>(checkingInfo, HttpStatus.OK);
	}
}
