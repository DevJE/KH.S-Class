package udp.practice;

import java.io.*;
import java.net.*;

public class UDPSpamSender {
	// 192.168.30.***;
	// �������� 10���� ip�� ���Ը޼����� �����ϴ� ���α׷� �ۼ�.
	public static void sender() {
		int port = 4000;
		int ipNumber = (int)((Math.random() * 78) + 1);
		int count = 1;
		
		try {
			String sNum = Integer.toString(ipNumber);
			
			StringBuilder sB = new StringBuilder();
			sB.append("192").append(".").append("168").append(".").append("30").append(".").append(sNum);
			
			DatagramSocket uSocket = new DatagramSocket();
			
			String text = "���� ����";
			byte []sending = text.getBytes();
			
			while(count < 11) {
				InetAddress cIP = InetAddress.getByName(sB.toString()/*"127.0.0.1"*/);
			
				System.out.print(count + " ");
				DatagramPacket pCket = new DatagramPacket(sending, 0, sending.length, cIP, port);
				
				uSocket.send(pCket);
				//uSocket.receive(pCket);
			
				count ++;
			}
			
			uSocket.close();
			
		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		sender();
		System.out.println("���۳�");

	}

}
