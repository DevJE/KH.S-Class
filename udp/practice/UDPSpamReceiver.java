package udp.practice;

import java.io.*;
import java.net.*;

public class UDPSpamReceiver {
	public static void receiver() {
		//�������� ���۵� ���Ը޼��� �޾Ƽ� ����ϴ� ���α׷�
		//���ѷ����� ���� �� ��Ŷ ������ ��� �޾� ����ϴ� ���α׷�.
		byte[] receiveM = new byte[6000];
		DatagramPacket pCket = null;
		try {
			DatagramSocket uClient = new DatagramSocket(4000);
			pCket = new DatagramPacket(receiveM, receiveM.length);
			
			//uClient.receive(pCket);
			
			/*String text = new String(receiveM);*/
			System.out.println("----�����ͼ���----");
			while(true) {
				uClient.receive(pCket);
				System.out.println("������ IP : " + pCket.getAddress());
				
				String message = new String(pCket.getData());
				System.out.println("���� ���� : " + message);
			}
			
			
		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public static void main(String[] args) {
		System.out.println("Receiver ������");
		receiver();

	}

}
