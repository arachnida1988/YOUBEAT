package com.you.payment;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.you.album.AlbumDAO;
import com.you.album.AlbumDTO;
import com.you.music.MusicDAO;
import com.you.music.MusicDTO;
import com.you.shoppingcart.ShoppingcartDAO;
import com.you.shoppingcart.ShoppingcartDTO;

@Service
public class PaymentService {

	@Autowired
	private PaymentDAO paymentDAO;
	@Autowired
	private ShoppingcartDAO shoppingcartDAO;
	@Autowired
	private MusicDAO musicDAO;
	@Autowired
	private AlbumDAO AlbumDAO;
	
	@Transactional
	public String checkout(PaymentDTO paymentDTO, Model model) {
		ShoppingcartDTO sDTO = new ShoppingcartDTO();
		List<MusicDTO> musicList = null;
		List<AlbumDTO> albumList = null;
		List<Integer> albumPrice = null;
		int totalPrice = 0;
		try {
			// 음악
			sDTO.setScategory("music");
			sDTO.setSid(paymentDTO.getPid());
			List<ShoppingcartDTO> cartMusic = this.shoppingcartDAO.shoppingcartList(sDTO);
			musicList = new ArrayList<>();
			for(ShoppingcartDTO sc : cartMusic) {
				MusicDTO m = this.musicDAO.musicView_cart(sc.getScategorynum());
				musicList.add(m);
				totalPrice += m.getMprice();
			}
			// 앨범
			sDTO.setScategory("album");
			sDTO.setSid(paymentDTO.getPid());
			List<ShoppingcartDTO> cartAlbum = this.shoppingcartDAO.shoppingcartList(sDTO);
			albumList = new ArrayList<>();
			albumPrice = new ArrayList<>();
			for(ShoppingcartDTO sc : cartAlbum) {
				AlbumDTO a = this.AlbumDAO.albumView(sc.getScategorynum());
				int price = this.musicDAO.getGenreAndPriceOfMusic(sc.getScategorynum());
				albumList.add(a);
				albumPrice.add(price);
				totalPrice += price;
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		// -------- 나중에 지우기 --------
		model.addAttribute("pid", paymentDTO.getPid());
		// ----------------------------
		model.addAttribute("musicList", musicList);
		model.addAttribute("albumList", albumList);
		model.addAttribute("albumPrice", albumPrice);
		model.addAttribute("totalPrice", totalPrice);
		return "payment/checkoutPage";
	}
	
	// 결제 완료 부분
	@Transactional
	public String paymentAdd(PaymentDTO paymentDTO, RedirectAttributes rd) {
		// 장바구니 불러오기
		ShoppingcartDTO sDTO = new ShoppingcartDTO();
		String message = "";
		String path = "";
		int result = 0;
		try {
			// 음악 부분
			sDTO.setScategory("music");
			sDTO.setSid(paymentDTO.getPid());
			List<ShoppingcartDTO> cartMusic = this.shoppingcartDAO.shoppingcartList(sDTO);
			for(ShoppingcartDTO sc : cartMusic) {
				paymentDTO.setPcategory("music");
				paymentDTO.setPcategorynum(sc.getScategorynum());
				System.out.println(paymentDTO.getPid());
				System.out.println(paymentDTO.getPprice());
				System.out.println(paymentDTO.getPcategory());
				System.out.println(paymentDTO.getPcategorynum());
				System.out.println(paymentDTO.getPcardtype());
				System.out.println(paymentDTO.getPname());
				// 결제 DB에 저장
				result = this.paymentDAO.paymentAdd(paymentDTO);
				// 장바구니 부분에서 삭제
				result = this.shoppingcartDAO.shoppingcartDelete(sc.getSnum());
			}
			// 앨범 부분
			sDTO.setScategory("album");
			sDTO.setSid(paymentDTO.getPid());
			List<ShoppingcartDTO> cartAlbum = this.shoppingcartDAO.shoppingcartList(sDTO);
			for(ShoppingcartDTO sc : cartAlbum) {
				paymentDTO.setPcategory("album");
				paymentDTO.setPcategorynum(sc.getScategorynum());
				// 결제 DB에 저장
				result = this.paymentDAO.paymentAdd(paymentDTO);
				// 장바구니 부분에서 삭제
				result = this.shoppingcartDAO.shoppingcartDelete(sc.getSnum());
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result > 0) {
			message = "결제 완료 !";
			path = "payment/checkoutResultPage";
		} else {
			message = "결제 실패..다시 시도해주세요";
			path = "redirect:/payment/checkoutPage";
			rd.addFlashAttribute("message", message);
		}
		return path;
	}
}
